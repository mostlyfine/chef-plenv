#
# Cookbook Name:: plenv
# Recipe:: install
#
# Copyright 2014, mostlyfine
#
# All rights reserved - Do Not Redistribute
#

execute "plenv init" do
  user node.plenv.user
  group node.plenv.group
  command "source #{node.plenv.profile_path}/plenv.sh; plenv rehash"
  action :run
end

node.plenv.build.each do |version|
  execute "perl install #{version}" do
    not_if "source #{node.plenv.profile_path}/plenv.sh; plenv versions | grep #{version}"
    command "source #{node.plenv.profile_path}/plenv.sh; plenv install #{version}"
    user node.plenv.user
    group node.plenv.group
    action :run
  end
end

execute "global perl change" do
  user node.plenv.user
  group node.plenv.group
  command "source #{node.plenv.profile_path}/plenv.sh; plenv global #{node.plenv.global}; plenv rehash"
  action :run
end

execute "cpanm install" do
  user node.plenv.user
  group node.plenv.group
  command "source #{node.plenv.profile_path}/plenv.sh; plenv install-cpanm; plenv rehash"
  action :run
end
