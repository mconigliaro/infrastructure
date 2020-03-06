def test_dovecot_is_running(host):
    assert host.service("dovecot").is_running


def test_dovecot_is_enabled(host):
    assert host.service("dovecot").is_enabled


def test_dovecot_is_listening(host):
    assert "tcp://0.0.0.0:143" in host.socket.get_listening_sockets()


def test_dovecot_auth_socket(host):
    file = host.file("/var/spool/postfix/private/dovecot-auth")
    assert file.exists
    assert file.user == "postfix"
    assert file.group == "postfix"
    assert file.mode == 0o666


def test_dovecot_lmtp_socket(host):
    file = host.file("/var/spool/postfix/private/dovecot-lmtp")
    assert file.exists
    assert file.user == "postfix"
    assert file.group == "postfix"
    assert file.mode == 0o666


def test_dovecot_sieve_before_scripts(host):
    assert host.file("/var/lib/dovecot/sieve_before.d/10-junk.svbin").exists
