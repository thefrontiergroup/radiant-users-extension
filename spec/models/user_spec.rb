require File.dirname(__FILE__) + "/../spec_helper"

describe User do
  
  dataset :devise_users
  
  it { should have_default_scope(:order => 'name') }
  
  it { should belong_to(:created_by).class_name('User') }
  it { should belong_to(:updated_by).class_name('User') }
  
  it { should validate_presence_of(:name) }
  # it { should validate_presence_of(:class_name) } not working
  
  describe "#login" do
    it 'should return username' do
      users(:admin).login.should === users(:admin).username
    end
  end
  
  describe '#admin?' do
    it 'should return whether the user is an admin' do
      users(:admin).admin?.should be_true
      users(:designer).admin?.should be_false
    end
  end
  
  describe '#designer?' do
    it 'should return whether the user is an designer' do
      users(:designer).designer?.should be_true
      users(:admin).designer?.should be_false
    end
  end
  
  describe "#update" do
    it 'should not update a users password if it is blank' do
      @user = users(:admin)
      @user.valid_password?('password').should be_true
      @user.update_attributes({ :password => "", :password_confirmation => "", :username => "newmin"})
      
      @user.valid?.should be_true
      @user.valid_password?('password').should be_true
      @user.username.should === 'newmin'
    end
  end
  
  describe "#login=" do
    it "should set the username" do
      @user = users(:admin)
      @user.login = "new username"
      @user.username.should == "new username"
    end
  end
  
  describe '#new_class_name' do
    it "should set the class_name" do
      @user = users(:admin)
      @user.new_class_name.should == @user.class_name
    end
  end
  
  describe '#new_class_name=' do
    before :each do
      @user = users(:admin)
      mock(UserActionObserver).current_user { @user}
    end
    it "should set the class_name" do
      @user.new_class_name = "boggle snap"
      @user.class_name.should == "boggle snap"
    end
    it "should not set the class name if they're not an admin" do
      @user = users(:designer)
      @user.new_class_name = "boggle snap"
      @user.class_name.should_not == "boggle snap"
    end
  end
  
  describe "self.unprotected_attributes" do
    it "should be an array of [:name, :email, :username, :login, :password, :password_confirmation, :locale]" do
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
  
  it "should return true for #authorized? userss" do
    users(:existing).authorized?.should be_true
    users(:designer).authorized?.should be_true
    users(:admin).authorized?.should be_true
  end
  
end

describe User, "inheritence" do
  
  class Visitor < User; end
  
  it "should be scoped by class_name" do
    v = Visitor.new
    v.class_name.should == "Visitor"
  end
  
end