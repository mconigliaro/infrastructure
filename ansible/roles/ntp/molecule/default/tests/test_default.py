def test_ntp(host):
    assert host.service('ntp').is_running
    assert host.service('ntp').is_enabled
