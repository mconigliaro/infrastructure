def test_monit_is_running(host):
    assert host.service('monit').is_running


def test_monit_is_enabled(host):
    assert host.service('monit').is_enabled

# FIXME: Needs net-tools installed
# def test_monit_is_listening(host):
#     assert 'tcp://127.0.0.1:2812' in host.socket.get_listening_sockets()
