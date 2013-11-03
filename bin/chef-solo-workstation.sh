#!/bin/bash 

chef-solo --color -c .chef/solo.rb -o 'role[workstation]'

