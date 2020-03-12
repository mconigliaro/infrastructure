def test_gpg_installed(host):
    assert host.exists("gpg")
