require File.dirname(__FILE__) + "/../spec_helper"

describe Users::Tags::Core, "collection" do
  
  it 'should describe these tags' do
    Users::Tags::Core.tags.sort.should == [
      'user',
      'user:if_user',
      'user:unless_user',
      'user:if_authorized',
      'user:unless_authorized',
      'user:name',
      'user:login',
      'user:username',
      'user:email',
      'user:class_name'
    ].sort
  end
  
end

describe Users::Tags::Core do

  dataset :pages, :devise_users
  
  before :each do
    @page = pages(:home)
    stub(@page).cache? { false }
    
    @user = users(:admin)
    stub(Users::Tags::Helper).current_user(anything) { @user }
  end
  
  describe '<r:user />' do
  
    it 'should render <r:user/> if the page is not cached' do
      tag = %{<r:user>success</r:user>}
      exp = %{success}
      
      @page.should render(tag).as(exp)
    end
    
    it 'should not render <r:user/> if the page is not cached' do
      stub(@page).cache? { true }
      
      tag = %{<r:user>failure</r:user>}
      exp = %{}
      
      @page.should render(tag).as(exp)
    end
    
  end
  
  describe '<r:user:if_user />' do
    
    it 'should render <r:if_user/> if there is a current user' do
      tag = %{<r:user:if_user>success</r:user:if_user>}
      exp = %{success}
      
      @page.should render(tag).as(exp)
    end
    
    it 'should not render <r:if_user/> if there is not a current user' do
      mock(Users::Tags::Helper).current_user(anything) { false }
      
      tag = %{<r:user:if_user>failure</r:user:if_user>}
      exp = %{}
      
      @page.should render(tag).as(exp)
    end
    
  end
  
  describe '<r:user:unless_user />' do
    
    it 'should render <r:unless_user/> if there is not a current user' do
      mock(Users::Tags::Helper).current_user(anything) { false }
      
      tag = %{<r:user:unless_user>success</r:user:unless_user>}
      exp = %{success}
      
      @page.should render(tag).as(exp)
    end
    
    it 'should not render <r:unless_user/> if there is a current user' do
      tag = %{<r:user:unless_user>failure</r:user:unless_user>}
      exp = %{}
      
      @page.should render(tag).as(exp)
    end
    
  end
  
  describe '<r:user:if_authorized />' do
    
    it 'should render <r:if_authorized/> if the user is a moderator' do
      tag = %{<r:user:if_authorized>success</r:user:if_authorized>}
      exp = %{success}
      
      @page.should render(tag).as(exp)
    end
    
    it 'should not render <r:if_authorized/> if the user is not a moderator' do
      @user = users(:non_admin)
      tag = %{<r:user:if_authorized>failure</r:user:if_authorized>}
      exp = %{}
      
      @page.should render(tag).as(exp)
    end
    
  end
  
  describe '<r:user:* />' do
    
    [:name, :login, :username, :email, :class_name].each do |symbol|
      
      it "should render <r:user:#{symbol} />" do
        tag = %{<r:user:#{symbol}/>}
        exp = @user.send(symbol)
        
        @page.should render(tag).as(exp)
      end
      
    end
    
  end

end