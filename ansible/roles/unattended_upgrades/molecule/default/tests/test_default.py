def test_unattended_upgrades(host):
    assert host.exists('unattended-upgrades')
