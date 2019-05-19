I've found that people who have never configured a "real" firewall before often seem to get confused with the multi-step process involved in configuring port mapping on something like a Cisco PIX. But it's really very simple when you understand the purpose of each step.

The first thing you need to do is create a static [NAT](http://www.cisco.com/en/US/tech/tk648/tk361/technologies_tech_note09186a0080094831.shtml) rule. This is how you map a "virtual" address (i.e. a public IP address on the "outside" interface of your firewall) to a "real" address (i.e. a private IP address behind your firewall). In the following example, I'll create a static NAT rule for a typical HTTP server:

    static (inside,outside) tcp interface 80 192.168.180.2 80 netmask 255.255.255.255

This command breaks down as follows:

* **static**: The command to modify static one-to-one NAT rules.
* **(inside,outside)**: The "real" IP address of the server is attached to the interface named "inside," and the "virtual" IP address of the server is attached to the interface named "outside."
* **tcp**: This rule matches TCP traffic.
* **interface 80**: This rule matches traffic sent to port 80 on the "virtual" IP address. Note that the "interface" keyword is like a variable that holds whatever IP address is assigned to the interface. You can use an actual IP address instead, but I like to use "interface" when possible, because it allows the access lists to keep working even if the PIX's public IP address changes.
* **192.168.180.2 80 netmask 255.255.255.255**: Map the incoming traffic to port 80 on 192.168.180.2 with a netmask of 255.255.255.255. You always use "netmask 255.255.255.255" when referring to a single host.

Static NAT rules allow you to direct incoming traffic to the appropriate servers behind your firewall. However, they do not say anything about *who* is allowed to send traffic to your servers, and the PIX will deny everything by default. This is where access lists come in. An access list asks four main questions:

* What *kind* of traffic are we talking about?
* Where is the traffic *originating*?
* Where is the traffic *going*?
* What do you want to *do* with the traffic (permit/deny)?

    access-list outside_access_in permit tcp any interface outside eq http

The access command breaks down as follows:

* **access-list**: The command to modify access lists.
* **outside_access_in**: The name of this particular access list.
* **permit**: This rule will permit traffic.
* **tcp**: Match TCP traffic.
* **any**: Match any source IP address. You could also specify a host or network here.
* **interface outside**: Match traffic destined for the IP address associated with the outside interface. Again, you could also specify a host or network here.
* **eq http**: Match traffic destined for the "http" port. Note that I could have used the port number (80) here as well.

Once the access list is created, we need to bind it to the appropriate interface. In this case, I want to bind it to the "outside" interface, since that's where my public port 80 traffic will be destined:

    access-group outside_access_in in interface outside
