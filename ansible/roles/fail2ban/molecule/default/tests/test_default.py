def test_fail2ban(host):
    assert host.service('fail2ban').is_running
    assert host.service('fail2ban').is_enabled
