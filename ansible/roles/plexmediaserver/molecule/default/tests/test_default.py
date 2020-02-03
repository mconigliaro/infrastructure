def test_plexmediaserver(host):
    assert host.service('plexmediaserver').is_running
    assert host.service('plexmediaserver').is_enabled
