def test_user_username(host):
    assert host.user("mike").name == "mike"
