import os

import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ['MOLECULE_INVENTORY_FILE']).get_hosts('all')


# FIXME: Why does this fail in Docker?
# def test_dovecot_listening_on_all_interfaces(host):
#     assert 'tcp://0.0.0.0:143' in host.socket.get_listening_sockets()
