# FIXME: Fails in Docker
def test_smartmontools_is_running(host):
    assert host.service("smartmontools").is_running


def test_smartmontools_is_enabled(host):
    assert host.service("smartmontools").is_enabled
