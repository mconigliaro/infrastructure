# Not supported in VirtualBox
default['mconigliaro_smartmontools']['enable'] = (virtualization['system'] == 'vbox' ? false : true)
