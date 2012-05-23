#
# Cookbook Name:: oh_my_zsh
# Resource:: default
#
# Copyright 2012, Michael Paul Thomas Conigliaro
#
actions :create, :remove

attribute :user, :kind_of => String, :name_attribute => true
attribute :system_install, :kind_of => [TrueClass, FalseClass]
attribute :manage_zshrc, :kind_of => [TrueClass, FalseClass]

def initialize(*args)
  super
  @action = :create
end
