#
# Cookbook Name:: github
# Resource:: sync
#
# Copyright 2012, Michael Paul Thomas Conigliaro
#
actions :create, :remove
default_action :create

attribute :local_dir, :kind_of => String, :name_attribute => true
attribute :local_user, :kind_of => String
attribute :users, :kind_of => Array
attribute :orgs, :kind_of => Array
