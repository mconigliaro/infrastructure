import os

import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ['MOLECULE_INVENTORY_FILE']).get_hosts('all')


def test_bsd_mailx(host):
    assert host.exists('mail')


def test_chkrootkit(host):
    assert host.exists('chkrootkit')


def test_curl(host):
    assert host.exists('curl')


def test_htop(host):
    assert host.exists('htop')


def test_iftop(host):
    assert host.exists('iftop')


def test_iotop(host):
    assert host.exists('iotop')


def test_iptraf(host):
    assert host.exists('iptraf')


def test_lsof(host):
    assert host.exists('lsof')


def test_mtr(host):
    assert host.exists('mtr')


def test_ngrep(host):
    assert host.exists('ngrep')


def test_nethogs(host):
    assert host.exists('nethogs')


def test_nmap(host):
    assert host.exists('nmap')


def test_psmisc(host):
    assert host.exists('pkill')


def test_silversearcher_ag(host):
    assert host.exists('ag')


def test_strace(host):
    assert host.exists('strace')


def test_tcpdump(host):
    assert host.exists('tcpdump')


def test_telnet(host):
    assert host.exists('telnet')


def test_tmux(host):
    assert host.exists('tmux')


def test_tshark(host):
    assert host.exists('tshark')


def test_usbmount(host):
    assert host.exists('/usr/share/usbmount/usbmount')


def test_vim(host):
    assert host.exists('vim')
