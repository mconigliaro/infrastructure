def test_nginx_is_running(host):
    assert host.service("nginx").is_running


def test_nginx_is_enabled(host):
    assert host.service("nginx").is_enabled


def test_nginx_http_is_listening(host):
    assert "tcp://0.0.0.0:80" in host.socket.get_listening_sockets()


def test_nginx_https_is_listening(host):
    assert "tcp://0.0.0.0:443" in host.socket.get_listening_sockets()
