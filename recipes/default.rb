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

package "libgd2-noxpm"
package "libssl0.9.8"

apt_repository 'openresty' do
  uri node['openresty']['package']['repo_url']
  distribution node['openresty']['package']['distribution']
end

package 'openresty' do
 action :install
 options '--allow-unauthenticated'
end
