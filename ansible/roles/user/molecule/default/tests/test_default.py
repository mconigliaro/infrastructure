def test_user_username(host):
    assert host.user("testuser").name == "testuser"
