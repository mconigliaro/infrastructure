def test_debconf_installed(host):
    assert host.exists('debconf')


def test_gpg_installed(host):
    assert host.exists('gpg')
