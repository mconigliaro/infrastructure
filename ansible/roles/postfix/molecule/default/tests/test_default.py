import os

import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ['MOLECULE_INVENTORY_FILE']).get_hosts('all')


# FIXME: Fails in Docker for some reason, until Postfix is restarted manually
def test_postfix_listening_on_all_interfaces(host):
    assert 'tcp://0.0.0.0:25' in host.socket.get_listening_sockets()
    assert 'tcp://0.0.0.0:587' in host.socket.get_listening_sockets()


def test_postfix_listening_on_loopback_interface(host):
    assert 'tcp://127.0.0.1:10025' in host.socket.get_listening_sockets()


def test_postgrey_listening_on_loopback_interface(host):
    assert 'tcp://127.0.0.1:10023' in host.socket.get_listening_sockets()


def test_amavis_listening_on_loopback_interface(host):
    assert 'tcp://127.0.0.1:10024' in host.socket.get_listening_sockets()
