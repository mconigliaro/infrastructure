def test_avahi(host):
    assert host.exists('avahi-daemon')
