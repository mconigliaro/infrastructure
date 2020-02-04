def test_vsftpd_is_running(host):
    assert host.service('vsftpd').is_running


def test_vsftpd_is_enabled(host):
    assert host.service('vsftpd').is_enabled


def test_vsftpd_is_listening(host):
    assert 'tcp://0.0.0.0:21' in host.socket.get_listening_sockets()
