#
# Cookbook Name:: databag_to_file
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

file "/tmp/creds" do
  owner "vagrant"
  group "vagrant"
  mode "0755"
  action :create
  content data_bag_item('admins', 'creds')['password']
end

mysql_creds = Chef::EncryptedDataBagItem.load("passwords", "mysql")
root_pw = mysql_creds["root"]
monitoring_pw = mysql_creds["monitoring"]
Chef::Log.info("The root mysql password is: ‘#{root_pw}’")
Chef::Log.info("The mysql monitoring password is: ‘#{monitoring_pw}’")
