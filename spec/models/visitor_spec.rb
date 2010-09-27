require 'spec/spec_helper'

class Visitor < User
  include Scoped::Models::User::Scoped
end

describe Visitor do

  dataset :scoped
  
  describe 'scope' do
    it 'should return only users with scoped access' do
      Visitor.count.should === User.all({:conditions => { :access => 'visitor' } }).count
    end
  end
  
  describe 'before_save set_access filter' do
    before :each do
      mock.instance_of(Visitor).save { true }
    end
    
    context 'a new object with no access set' do
      it 'should set access to visitor' do        
        @visitor = Visitor.new
        @visitor.access.should === 'visitor'
        @visitor.save
        @visitor.access.should === 'visitor'
      end
    end
    
    context 'an existing object with access set' do
      @visitor = Visitor.new
      @visitor.access = 'not visitor'
      @visitor.access.should === 'not visitor'
      @visitor.save
      @visitor.access.should === 'not visitor'
    end
  end
  
end