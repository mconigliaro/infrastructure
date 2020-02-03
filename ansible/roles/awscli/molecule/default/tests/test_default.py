def test_awscli_package_not_installed(host):
    assert not host.package('awscli').is_installed


def test_aws_installed(host):
    assert host.exists('aws')
