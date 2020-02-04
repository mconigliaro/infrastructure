def test_fail2ban_is_running(host):
    assert host.service('fail2ban').is_running


def test_fail2ban_is_enabled(host):
    assert host.service('fail2ban').is_enabled
