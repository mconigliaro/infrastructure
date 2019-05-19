A couple years ago, I decided it would be a good learning experience to replace my old Linksys firewall/router with something more professional (like a Cisco PIX). I also decided that I wasn't going to cheat by using the web interface. As you can imagine, this turned the learning curve into something resembling a brick wall, but things got easier once I figured out how to connect the thing to the Internet. What follows are some old notes that I hope someone else out there will find useful.

Since I have DSL at home, the first thing I needed to do was configure the PPPoE client:

    vpdn group ISP request dialout pppoe
    vpdn group ISP localname <username>
    vpdn group ISP ppp authentication pap
    vpdn username <username> password <password>

Next, I had to tell the PIX to obtain its public IP address and default route via PPPoE:

    ip address outside pppoe setroute

Incidentally, those of you with cable modems have it a lot easier. You can skip all the PPPoE stuff and just enable the DHCP client on the outside interface:

    ip address outside dhcp setroute
