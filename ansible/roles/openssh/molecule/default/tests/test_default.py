def test_ssh_is_running(host):
    assert host.service('ssh').is_running


def test_ssh_is_enabled(host):
    assert host.service('ssh').is_enabled


def test_ssh_is_listening(host):
    assert 'tcp://0.0.0.0:22' in host.socket.get_listening_sockets()
