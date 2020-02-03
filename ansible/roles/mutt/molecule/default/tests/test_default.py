def test_mutt_installed(host):
    assert host.exists('mutt')
