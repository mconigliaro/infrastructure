import os

import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ['MOLECULE_INVENTORY_FILE']).get_hosts('all')


def test_monit(host):
    assert host.exists('monit')
    # FIXME: Doesn't work in Docker
    # assert host.service('monit').is_running
    # assert host.service('monit').is_enabled
