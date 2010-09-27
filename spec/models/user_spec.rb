require 'spec/spec_helper'

describe User do

  dataset :users
  
  describe '#access attribute' do
    it 'should be protected' do
      @user = User.new({
        :access => 'everything'
      })
      
      @user.access.should === ''
    end
  end
  
  describe '#generate_api_key' do
    it 'should generate an api key on initialize' do
      @user = User.new
      @user.api_key.should_not be_nil
    end
  end
  
end