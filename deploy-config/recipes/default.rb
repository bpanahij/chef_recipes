#
# Cookbook Name:: passport_config
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
node[:deploy].each do |app, deploy|
  directory "#{deploy[:deploy_to]}/node_modules/config" do
      owner "deploy"
      group "www-data"
      mode 0774
      recursive true
      action :create
    end
  file File.join(deploy[:deploy_to], 'node_modules', 'config', 'index.json') do
    content JSON.dump(node[:config][app])
  end
end
