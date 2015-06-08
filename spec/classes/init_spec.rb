require 'spec_helper'
describe 'useraccounts' do

  context 'with defaults for all parameters' do
    it { should contain_class('useraccounts') }
  end
end
