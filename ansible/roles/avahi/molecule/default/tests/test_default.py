def test_avahi_is_running(host):
    assert host.service('avahi-daemon').is_running


def test_avahi_is_enabled(host):
    assert host.service('avahi-daemon').is_enabled


def test_avahi_is_listening(host):
    assert 'udp://0.0.0.0:5353' in host.socket.get_listening_sockets()
