# encoding: utf-8
require 'spec_helper'

# Write unit tests with ChefSpec - https://github.com/sethvargo/chefspec#readme
describe 'openresty::default' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'installs libgd2-noxpm' do
    expect(chef_run).to install_package('libgd2-noxpm')
  end

  it 'installs libssl0.9.8' do
    expect(chef_run).to install_package('libssl0.9.8')
  end

  it 'installs openresty' do
    expect(chef_run).to install_package('openresty')
  end

  it 'enables nginx' do
    expect(chef_run).to enable_service('nginx')
  end

  it 'starts nginx' do
    expect(chef_run).to start_service('nginx')
  end
end
