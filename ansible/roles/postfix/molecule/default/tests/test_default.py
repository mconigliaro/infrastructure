def test_postfix_is_running(host):
    assert host.service('postfix').is_running


def test_postfix_is_enabled(host):
    assert host.service('postfix').is_enabled


def test_postfix_smtp_is_listening(host):
    assert 'tcp://0.0.0.0:25' in host.socket.get_listening_sockets()


def test_postfix_smtp_amavis_is_listening(host):
    assert 'tcp://127.0.0.1:10025' in host.socket.get_listening_sockets()


def test_postfix_submission_is_listening(host):
    assert 'tcp://0.0.0.0:587' in host.socket.get_listening_sockets()


def test_amavis_is_running(host):
    assert host.service('amavis').is_running


def test_amavis_is_enabled(host):
    assert host.service('amavis').is_enabled


def test_amavis_is_listening(host):
    assert 'tcp://127.0.0.1:10024' in host.socket.get_listening_sockets()


def test_postgrey_is_running(host):
    assert host.service('postgrey').is_running


def test_postgrey_is_enabled(host):
    assert host.service('postgrey').is_enabled


def test_postgrey_is_listening(host):
    assert 'tcp://127.0.0.1:10023' in host.socket.get_listening_sockets()
