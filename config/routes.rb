ActionController::Routing::Routes.draw do |map|

  map.with_options(:controller => 'admin/welcome') do |welcome|
    welcome.login   'login',    :action => 'login'
    welcome.logout  'logout',   :action => 'logout'
  end
    
end