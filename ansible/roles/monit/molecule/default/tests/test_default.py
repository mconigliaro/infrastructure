def test_monit(host):
    assert host.exists('monit')
    assert host.service('monit').is_running
    assert host.service('monit').is_enabled
