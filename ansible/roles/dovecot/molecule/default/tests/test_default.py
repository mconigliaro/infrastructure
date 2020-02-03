def test_dovecot_listening_on_all_interfaces(host):
    assert 'tcp://0.0.0.0:143' in host.socket.get_listening_sockets()
