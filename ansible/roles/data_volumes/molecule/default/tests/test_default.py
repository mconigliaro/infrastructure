import os

import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ['MOLECULE_INVENTORY_FILE']).get_hosts('all')


def test_data_volumes(host):
    assert host.mount_point('/mnt/test0').exists
    assert host.mount_point('/mnt/test0').device == '/dev/loop0'
    assert host.mount_point('/mnt/test0').filesystem == 'ext4'

    assert host.mount_point('/mnt/test1').exists
    assert host.mount_point('/mnt/test1').device == '/dev/loop1'
    assert host.mount_point('/mnt/test1').filesystem == 'ext4'

    assert host.mount_point('/mnt/test2').exists
    assert host.mount_point('/mnt/test2').device == '/dev/loop2'
    assert host.mount_point('/mnt/test2').filesystem == 'ext4'
