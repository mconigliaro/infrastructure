import os

import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ['MOLECULE_INVENTORY_FILE']).get_hosts('all')


def test_block_devices(host):
    assert host.file('/tmp/test1').exists
    assert host.file('/tmp/test2').exists
