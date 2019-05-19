This example assumes that you have properly configured DNS servers, [so that the Kerberos realm can be discovered via DNS](http://publib.boulder.ibm.com/infocenter/iseries/v5r3/index.jsp?topic=/rzakh/rzakhdefinerealmsdns.htm). This should get taken care of for you automatically on Active Directory domains:


    _kerberos             IN  TXT  EXAMPLE.COM
    _kerberos._udp        IN  SRV  0 0 88 server.example.com.
    _kerberos._tcp        IN  SRV  0 0 88 server.example.com.
    _kpasswd._udp         IN  SRV  0 0 464 server.example.com.
    _kpasswd._tcp         IN  SRV  0 0 464 server.example.com.
    _ldap._tcp.dc._msdcs  IN  SRV  0 0 389 server.example.com.

On your Linux box, set the fully-qualified hostname in **/etc/sysconfig/network** and **/etc/hosts**. Note that the first part of your hostname must be no longer than 15 characters and unique in the domain:

    # /etc/sysconfig/network
    HOSTNAME=myhostname.example.com


    # /etc/hosts
    127.0.0.1  myhostname.example.com  myhostname  localhost.localdomain localhost

Make sure your Linux box has a properly configured DNS client (probably pointing at your domain controllers):

    search example.com
    nameserver 192.168.1.10

Since Kerberos is very sensitive to clock drift, it's a good idea to configure your Linux box as an NTP client to your domain controllers. Edit **/etc/ntp.conf** like so:

    server server.example.com

Install Winbind and configure the service to start automatically:

    yum install samba-common
    chkconfig winbind on

Use Red hat's **authconfig** command to configure Winbind authentication:

    authconfig \
      --disablecache \
      --enablewinbind \
      --enablewinbindauth \
      --smbsecurity=ads \
      --smbworkgroup=EXAMPLE \
      --smbrealm=EXAMPLE.COM \
      --enablewinbindusedefaultdomain \
      --winbindtemplatehomedir=/home/%U \
      --winbindtemplateshell=/bin/bash \
      --enablekrb5 \
      --krb5realm=EXAMPLE.COM \
      --enablekrb5kdcdns \
      --enablekrb5realmdns \
      --enablelocauthorize \
      --enablemkhomedir \
      --enablepamaccess \
      --updateall

Now you should be able to join your Linux box to the domain:

    net ads join -U Administrator

Start (or restart) the Winbind service:

    service restart winbind

At this point, your Linux box should be participating on the Windows domain. You can test this by issuing **wbinfo -u** (to list all users in the domain), **wbinfo -g** (to list all groups in the domain), and **getent passwd administrator** (to list account information for the domain administrator).
