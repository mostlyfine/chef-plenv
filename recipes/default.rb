#
# Cookbook Name:: plenv
# Recipe:: default
#
# Copyright 2014, mostlyfine
#
# All rights reserved - Do Not Redistribute
#

group node.plenv.group do
  members node.plenv.members
  append true
  action :create
end

git node.plenv.plenv_root do
  not_if { File.exist?(node.plenv.plenv_root) }
  user node.plenv.user
  group node.plenv.group
  repository "git://github.com/tokuhirom/plenv.git"
  reference "master"
  action :sync
end

directory "#{node.plenv.plenv_root}/plugins" do
  not_if { File.exist?("#{node.plenv.plenv_root}/plugins") }
  owner node.plenv.user
  group node.plenv.group
  mode '0755'
  recursive true
  action :create
end

git "#{node.plenv.plenv_root}/plugins/perl-build" do
  not_if { File.exist?("#{node.plenv.plenv_root}/plugins/perl-build") }
  user node.plenv.user
  group node.plenv.group
  repository "git://github.com/tokuhirom/perl-build.git"
  reference "master"
  action :sync
end

git "#{node.plenv.plenv_root}/plugins/plenv-update" do
  not_if { File.exist?("#{node.plenv.plenv_root}/plugins/plenv-update") }
  user node.plenv.user
  group node.plenv.group
  repository "git://github.com/Tacahilo/plenv-update.git"
  reference "master"
  action :sync
end

directory node.plenv.profile_path do
  not_if { File.exist?(node.plenv.profile_path) }
  owner node.plenv.user
  group node.plenv.group
  mode '0755'
  recursive true
  action :create
end

template "#{node.plenv.profile_path}/plenv.sh" do
  not_if { File.exist?("#{node.plenv.profile_path}/plenv.sh" ) }
  owner node.plenv.user
  group node.plenv.group
  mode '0644'
end
