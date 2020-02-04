def test_plexmediaserver_is_running(host):
    assert host.service('plexmediaserver').is_running


def test_plexmediaserver_is_enabled(host):
    assert host.service('plexmediaserver').is_enabled


def test_plexmediaserver_is_listening(host):
    assert 'tcp://0.0.0.0:32400' in host.socket.get_listening_sockets()
