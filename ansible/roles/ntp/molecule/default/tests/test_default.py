def test_ntp_is_running(host):
    assert host.service('ntp').is_running


def test_ntp_is_enabled(host):
    assert host.service('ntp').is_enabled


def test_ntp_is_listening(host):
    assert 'udp://0.0.0.0:123' in host.socket.get_listening_sockets()
