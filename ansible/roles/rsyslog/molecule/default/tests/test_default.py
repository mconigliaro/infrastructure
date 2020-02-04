def test_rsyslog_is_running(host):
    assert host.service('rsyslog').is_running


def test_rsyslog_is_enabled(host):
    assert host.service('rsyslog').is_enabled
