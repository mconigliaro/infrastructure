#
# Cookbook Name:: mysql
# Recipe:: utils
#
# Copyright 2011, Michael Paul Thomas Conigliaro
#
%w{
  maatkit
  mytop
}.each { |p| package p }
