def test_rspamd_is_running(host):
    assert host.service('rspamd').is_running


def test_rspamd_is_enabled(host):
    assert host.service('rspamd').is_enabled


def test_rspamd_proxy_is_listening(host):
    assert 'tcp://127.0.0.1:11332' in host.socket.get_listening_sockets()


def test_rspamd_milter_is_listening(host):
    assert 'tcp://127.0.0.1:11333' in host.socket.get_listening_sockets()


def test_rspamd_web_is_listening(host):
    assert 'tcp://127.0.0.1:11334' in host.socket.get_listening_sockets()
