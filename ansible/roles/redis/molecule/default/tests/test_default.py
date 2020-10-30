def test_vm_overcommit_memory(host):
    assert host.sysctl("vm.overcommit_memory") == 1


# FIXME: Doesn't work in Docker
# def test_transparent_hugepages(host):
#     assert host.file('/sys/kernel/mm/transparent_hugepage/enabled').contains("\[never\]")


def test_redis_is_running(host):
    assert host.service("redis-server").is_running


def test_redis_is_enabled(host):
    assert host.service("redis-server").is_enabled


def test_redis_is_listening(host):
    assert "tcp://127.0.0.1:6379" in host.socket.get_listening_sockets()
