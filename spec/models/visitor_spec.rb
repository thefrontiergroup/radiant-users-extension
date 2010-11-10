require 'spec/spec_helper'

class SomeVisitor < User
  include Users::Models::User::Scoped
end

describe SomeVisitor do

  dataset :scoped_users
  
  describe 'scope' do
    it 'should return only users with scoped access' do
      SomeVisitor.count.should === User.all({:conditions => { :access => 'some_visitor' } }).count
    end
  end
  
  describe 'before_save set_access filter' do
    before :each do
      mock.instance_of(SomeVisitor).save { true }
    end
    
    context 'a new object with no access set' do
      it 'should set access to visitor' do        
        @visitor = SomeVisitor.new
        @visitor.access.should === 'some_visitor'
        @visitor.save
        @visitor.access.should === 'some_visitor'
      end
    end
    
    context 'an existing object with access set' do
      @visitor = SomeVisitor.new
      @visitor.access = 'not visitor'
      @visitor.access.should === 'not visitor'
      @visitor.save
      @visitor.access.should === 'not visitor'
    end
  end
  
end