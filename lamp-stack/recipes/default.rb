#
# Cookbook:: lamp-stack
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
include_recipe "apt"

package 'nginx' do
    action :install
  end

service 'nginx' do
    action [ :enable, :start ]
  end

cookbook_file "/usr/share/nginx/www/index.html" do
    source "index.html"
    mode "0644"
  end