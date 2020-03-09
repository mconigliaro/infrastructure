# FIXME: Fails on bionic
def test_raid_devices(host):
    assert host.file("/dev/md127").exists
