# FIXME: Fails in Docker
def test_sysstat_is_running(host):
    assert host.service("sysstat").is_running


def test_sysstat_is_enabled(host):
    assert host.service("sysstat").is_enabled
