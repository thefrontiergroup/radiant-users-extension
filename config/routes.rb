ActionController::Routing::Routes.draw do |map|

  map.login   'login',  :controller => 'admin/welcome', :action => 'login'
  map.logout  'logout', :controller => 'admin/welcome', :action => 'logout'
    
end
