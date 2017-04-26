# Not supported in VirtualBox
default['mconigliaro_smartmontools']['enable'] = (node['virtualization']['system'] == 'vbox' ? false : true)
