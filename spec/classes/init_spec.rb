require 'spec_helper'
describe 'vpnize' do

  context 'with defaults for all parameters' do
    it { should contain_class('vpnize') }
  end
end
