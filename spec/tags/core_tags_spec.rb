require File.dirname(__FILE__) + "/../spec_helper"

describe Users::Tags::CoreTags, "collection" do
  
  it 'should describe these tags' do
    Users::Tags::CoreTags.tags.sort.should == [
      'user',
      'user:if_user',
      'user:unless_user',
      'user:if_authorized',
      'user:unless_authorized',
      'user:if_admin',
      'user:unless_admin',
      'user:name',
      'user:first_name',
      'user:last_name',
      'user:login',
      'user:email',
      'user:access'
    ].sort
  end
  
end

describe Users::Tags::CoreTags do

  dataset :pages, :devise_users
  
  before :each do
    @page = pages(:home)
  end
  
  describe '<r:user />' do
  
    it 'should render <r:user/> if the page is not cached' do
      mock(@page).cache? { false }
    
      tag = %{<r:user>success</r:user>}
      exp = %{success}
    
      @page.should render(tag).as(exp)
    end
    
    it 'should not render <r:user/> if the page is not cached' do
      mock(@page).cache? { true }
    
      tag = %{<r:user>failure</r:user>}
      exp = %{}
    
      @page.should render(tag).as(exp)
    end
    
  end
  
  describe '<r:user:if_user />' do
    
    it 'should render <r:if_user/> if there is a current user' do
      mock(Users::Tags::Helper).current_user(anything) { users(:admin) }
    
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

end