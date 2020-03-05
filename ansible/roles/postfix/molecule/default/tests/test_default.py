# FIXME: Why doesn't this work in Docker?
# def test_postfix_is_running(host):
#     assert host.service("postfix").is_running


def test_postfix_is_enabled(host):
    assert host.service("postfix").is_enabled


def test_postfix_smtp_is_listening(host):
    assert "tcp://0.0.0.0:25" in host.socket.get_listening_sockets()


def test_postfix_submission_is_listening(host):
    assert "tcp://0.0.0.0:587" in host.socket.get_listening_sockets()
