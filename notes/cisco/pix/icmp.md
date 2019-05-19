By default, a Cisco PIX will not accept ICMP traffic originating from the outside interface. This means you will not be able to ping or traceroute to anything through the PIX, which will obviously make troubleshooting very difficult. The following access list will enable some useful ICMP replies.

    object-group icmp-type IcmpReplies
    icmp-object echo-reply
    icmp-object time-exceeded
    icmp-object unreachable
    exit
    access-list outside_access_in permit icmp any any object-group IcmpReplies
    access-group outside_access_in in interface outside

A PIX will also not allow you to ping/traceroute to the outside interface by default, which means nobody will be able to ping or traceroute to you. The following commands will allow this.

    icmp permit any traceroute outside
    icmp permit any echo outside
    icmp permit any echo-reply outside
    icmp permit any unreachable outside
