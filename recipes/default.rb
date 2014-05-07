# encoding: utf-8
#
# Cookbook Name:: openresty
# Recipe:: default
#
# Copyright (C) 2014, Darron Froese <darron@froese.org>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'chef-sugar::default'

execute 'apt-get update' do
  command 'apt-get update'
end

case node['platform_version']
when '12.04'
  package 'libgd2-noxpm'
when '14.04'
  package 'libgd2-noxpm-dev'
end

package 'libssl0.9.8'

package 'curl'

bash 'install repo' do
  user 'root'
  cwd '/tmp'
  code <<-EOH
    curl https://packagecloud.io/install/repositories/darron/openresty/script.deb | sudo bash
  EOH
end

package 'openresty' do
  action :install
end

service 'nginx' do
  supports :status => true # rubocop:disable HashSyntax
  action [:enable, :start]
end
