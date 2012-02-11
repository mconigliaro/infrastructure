#
# Cookbook Name:: mysql
# Recipe:: default
#
# Copyright 2011, Michael Paul Thomas Conigliaro
#
include_recipe 'mysql::server', 'mysql::utils', 'mysql::automysqlbackup'
