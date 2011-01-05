ActionController::Routing::Routes.draw do |map|
  
  map.devise_for                :users,         :path_names => { :sign_in => 'login', :sign_out => 'logout' }
  map.new_user_session          'login',        :controller => 'sessions',      :action => 'new',     :conditions => { :method => :get  }
  map.old_user_session          'admin/login',  :controller => 'sessions',      :action => 'new',     :conditions => { :method => :get  }
  map.user_session              'login',        :controller => 'sessions',      :action => 'create',  :conditions => { :method => :post }
  map.destroy_user_session      'logout',       :controller => 'sessions',      :action => 'destroy', :conditions => { :method => :get  }
  map.old_destroy_user_session  'admin/logout', :controller => 'sessions',      :action => 'destroy', :conditions => { :method => :get  }
  
  map.user_root_path            'users/root',   :controller => 'admin/welcome', :action => 'index'
  # This can redirect to anything by overiding ApplicationController#default_admin_path
  
end