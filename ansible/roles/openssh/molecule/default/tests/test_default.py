def test_openssh(host):
    assert host.service('ssh').is_running
    assert host.service('ssh').is_enabled
