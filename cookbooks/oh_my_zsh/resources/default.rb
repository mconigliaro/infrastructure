#
# Cookbook Name:: oh_my_zsh
# Resource:: default
#
# Copyright 2012, Michael Paul Thomas Conigliaro
#
actions :create, :remove
default_action :create

attribute :user, :kind_of => String, :name_attribute => true
attribute :manage_zshrc, :kind_of => [TrueClass, FalseClass]
attribute :theme, :kind_of => String
attribute :plugins, :kind_of => Array
