def test_dovecot_is_running(host):
    assert host.service('dovecot').is_running


def test_dovecot_is_enabled(host):
    assert host.service('dovecot').is_enabled


def test_dovecot_is_listening(host):
    assert 'tcp://0.0.0.0:143' in host.socket.get_listening_sockets()
