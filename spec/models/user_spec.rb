require File.dirname(__FILE__) + "/../spec_helper"

describe User do
  
  dataset :devise_users
  
  it { should have_default_scope(:order => 'name') }
  
  it { should belong_to(:created_by).class_name('User') }
  it { should belong_to(:updated_by).class_name('User') }
  
  describe "#login" do
    it 'should return username' do
      users(:admin).login.should === users(:admin).username
    end
  end
  
  describe "#login=" do
    it "should set the username" do
      @user = users(:admin)
      @user.login = "new username"
      @user.username.should == "new username"
    end
  end
  
  describe "self.unprotected_attributes" do
    it "should be an array of [:name, :email, :login, :password, :password_confirmation, :locale]" do
      # Make sure we clean up after anything set in another spec
      User.instance_variable_set(:@unprotected_attributes, nil)
      User.unprotected_attributes.should == [:name, :email, :username, :login, :password, :password_confirmation, :locale]
    end
  end
  describe "self.unprotected_attributes=" do
    it "should set the @@unprotected_attributes variable to the given array" do
      User.unprotected_attributes = [:password, :email, :other]
      User.unprotected_attributes.should == [:password, :email, :other]
    end
  end
  
  describe "self.find_for_authentication" do
    it "should find by username" do
      @user = User.find_for_authentication({:login => users(:admin).username})
      @user.should === users(:admin)
    end
  end
  
end

describe User, "roles" do
  
  dataset :devise_users
  
  it "should not have a non-existent role" do
    users(:existing).has_role?(:foo).should be_false
  end
  
  it "should not have a role for which the corresponding method returns false" do
    users(:existing).has_role?(:designer).should be_false
    users(:existing).has_role?(:admin).should be_false
  end
  
  it "should have a role for which the corresponding method returns true" do
    users(:designer).has_role?(:designer).should be_true
    users(:admin).has_role?(:admin).should be_true
  end
end