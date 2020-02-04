def test_samba_smbd_is_running(host):
    assert host.service('smbd').is_running


def test_samba_smbd_is_enabled(host):
    assert host.service('smbd').is_enabled


def test_samba_smbd_netbios_session_is_listening(host):
    assert 'tcp://0.0.0.0:139' in host.socket.get_listening_sockets()


def test_samba_smbd_file_sharing_is_listening(host):
    assert 'tcp://0.0.0.0:445' in host.socket.get_listening_sockets()


def test_samba_nmbd_is_running(host):
    assert host.service('nmbd').is_running


def test_samba_nmbd_is_enabled(host):
    assert host.service('nmbd').is_enabled


def test_samba_nmbd_netbios_name_is_listening(host):
    assert 'udp://0.0.0.0:137' in host.socket.get_listening_sockets()


def test_samba_nmbd_netbios_datagram_is_listening(host):
    assert 'udp://0.0.0.0:138' in host.socket.get_listening_sockets()
