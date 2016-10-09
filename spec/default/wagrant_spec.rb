require 'spec_helper'

describe package('apache2') do
  it { should be_installed }
end

describe service('apache2') do
  it { should be_enabled }
  it { should be_running }
end

describe command('apache2ctl -M') do
    its(:exit_status) { should eq 0 }
    its(:stdout) { should match /rewrite_module/ }
    its(:stdout) { should match /ssl_module/ }
end

describe port(80) do
  it { should be_listening }
end

describe port(443) do
  it { should be_listening }
end

describe package('mysql-server') do
  it { should be_installed }
end

describe service('mysql') do
  it { should be_enabled }
  it { should be_running }
end

describe port(3306) do
  it { should be_listening }
end

describe command('echo "show databases;" | mysql -uroot -pvagrant') do
  let(:disable_sudo) { true }
  its(:exit_status) { should eq 0 }
  its(:stdout) { should match /information_schema/ }
end

describe command('php -v') do
  let(:disable_sudo) { true }
  its(:exit_status) { should eq 0 }
  its(:stdout) { should match /PHP 7\./ }
end

describe command('composer help') do
  let(:disable_sudo) { true }
  its(:exit_status) { should eq 0 }
end

describe command('node -v') do
  let(:disable_sudo) { true }
  its(:exit_status) { should eq 0 }
  its(:stdout) { should match /v6\./ }
end

describe command('ruby -v') do
  let(:disable_sudo) { true }
  its(:exit_status) { should eq 0 }
  its(:stdout) { should match /ruby 2\.3\./ }
end

commands = %w{
  curl
  git
  jq
  travis
}

commands.each do |commands|
  describe command("which " + Shellwords.shellescape(commands)) do
    let(:disable_sudo) { true }
    its(:exit_status) { should eq 0 }
  end
end

