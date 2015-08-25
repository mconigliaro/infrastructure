#
# Cookbook Name:: mconigliaro_postfix
# Recipe:: postgrey
#
# Copyright (c) 2015 Mike Conigliaro, All Rights Reserved.
package 'postgrey'

template '/etc/default/postgrey' do
  variables(
    delay: node['mconigliaro_postfix']['postgrey']['delay']
  )
  mode 00644
end

mconigliaro_monit_service 'postgrey'
