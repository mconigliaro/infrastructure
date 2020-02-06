def test_borg(host):
    assert host.exists('borg')


def test_sshfs(host):
    assert host.exists('sshfs')


def test_borg_backup(host):
    assert host.exists('borg_backup')
