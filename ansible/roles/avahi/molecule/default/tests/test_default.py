def test_dbus_is_running(host):
    assert host.service("dbus").is_running


def test_dbus_is_enabled(host):
    assert host.service("dbus").is_enabled


# FIXME: Fails on bionic
def test_dbus_is_listening(host):
    assert (
        "unix:///var/run/dbus/system_bus_socket" in host.socket.get_listening_sockets()
    )


def test_avahi_is_running(host):
    assert host.service("avahi-daemon").is_running


def test_avahi_is_enabled(host):
    assert host.service("avahi-daemon").is_enabled


def test_avahi_is_listening(host):
    assert "udp://0.0.0.0:5353" in host.socket.get_listening_sockets()
