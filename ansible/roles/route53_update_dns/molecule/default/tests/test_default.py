def test_hosts_file(host):
    assert host.exists('route53_update_dns')
