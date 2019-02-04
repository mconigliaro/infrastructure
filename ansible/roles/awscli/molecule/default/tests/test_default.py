import os

import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ['MOLECULE_INVENTORY_FILE']).get_hosts('all')


def test_awscli_package_not_installed(host):
    assert not host.package('awscli').is_installed


def test_aws_installed(host):
    assert host.exists('aws')
