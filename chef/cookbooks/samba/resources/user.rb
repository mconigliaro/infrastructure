#
# Cookbook Name:: samba
# Resource:: user
#
# Copyright 2012, Michael Paul Thomas Conigliaro
#
actions :create, :remove

attribute :username, :kind_of => String, :name_attribute => true
attribute :password, :kind_of => String

def initialize(*args)
  super
  @action = :create
end
