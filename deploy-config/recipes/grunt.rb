#
# Cookbook Name:: passport_config
# Recipe:: default
#
# Copyright 2014, PassportEDU
#
# All rights reserved - Do Not Redistribute
#
node[:deploy].each do |app, deploy|
    action :install
    package "grunt-cli"
    flags "--global"
end

  # provisions npm application dependencies
  execute 'npm install' do
    cwd "#{deploy[:deploy_to]}/current"
    command '/usr/local/bin/npm install'
    user "deploy"
    group "apache"
  end

  # provisions bower application dependencies
  execute 'bower install' do
    cwd "#{deploy[:deploy_to]}/current"
    command 'bower install'
    user "deploy"
    group "apache"
    env 'HOME' => "/home/#{node.marinara.application.user}"
  end

  # optimizes browser assets
  execute 'grunt build' do
    cwd "#{deploy[:deploy_to]}/current"
    command 'grunt build'
    user "deploy"
    group "apache"
  end
