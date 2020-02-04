def test_users(host):
    assert host.user('mike').name == 'mike'
