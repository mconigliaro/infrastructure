import os

import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ['MOLECULE_INVENTORY_FILE']).get_hosts('all')


def test_bsd_mailx(host):
    host.exists('mail')


def test_chkrootkit(host):
    host.exists('chkrootkit')


def test_curl(host):
    host.exists('curl')


def test_htop(host):
    host.exists('htop')


def test_iftop(host):
    host.exists('iftop')


def test_iotop(host):
    host.exists('iotop')


def test_iptraf(host):
    host.exists('iptraf')


def test_lsof(host):
    host.exists('lsof')


def test_mtr(host):
    host.exists('mtr')


def test_ngrep(host):
    host.exists('ngrep')


def test_nethogs(host):
    host.exists('nethogs')


def test_nmap(host):
    host.exists('nmap')


def test_psmisc(host):
    host.exists('pkill')


def test_silversearcher_ag(host):
    host.exists('ag')


def test_strace(host):
    host.exists('strace')


def test_tcpdump(host):
    host.exists('tcpdump')


def test_telnet(host):
    host.exists('telnet')


def test_tmux(host):
    host.exists('tmux')


def test_tshark(host):
    host.exists('tshark')


def test_usbmount(host):
    host.exists('usbmount')


def test_vim(host):
    host.exists('vim')
