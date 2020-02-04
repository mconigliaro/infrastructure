def test_dbus_is_running(host):
    assert host.service('dbus').is_running


def test_dbus_is_enabled(host):
    assert host.service('dbus').is_enabled


def test_dbus_is_listening(host):
    assert 'unix:///var/run/dbus/system_bus_socket' in host.socket.get_listening_sockets()
