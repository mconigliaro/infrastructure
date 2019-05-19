The following commands with enable the SSH server on a Cisco PIX. Note that the last command can be used multiple times in order to allow access from different networks. Alternatively, you can use "0.0.0.0 0.0.0.0" to allow access from anywhere. Also note that when you connect to the PIX via SSH, the default username is "pix."

    ca zeroize rsa
    ca generate rsa key 1024
    ca save all
    ssh <network> <mask> <interface>

The telnet server is enabled like this:

    telnet <network> <mask> <interface>

And for you cheaters out there, the web interface is enabled like this:

    http server enable
    http 0.0.0.0 0.0.0.0 inside
