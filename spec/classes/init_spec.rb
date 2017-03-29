require 'spec_helper'
describe 'simplemnt' do
  context 'with default values for all parameters' do
    it { should contain_class('simplemnt') }
  end
end
