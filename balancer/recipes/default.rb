#
# Cookbook:: balancer
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

  execute "load-balancer" do
    command "sudo rm /etc/nginx/sites-enabled/default && sudo service nginx restart"
  end

  template '/etc/nginx/conf.d/loadbalancer.conf' do
    source 'template.erb'
    variables( :a => '10.1.0.101', :b => '10.1.0.102', :c => '10.1.0.103' )
  end