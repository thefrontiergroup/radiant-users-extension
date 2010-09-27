class ScopedDataset < Dataset::Base
  
  def load
    create_model :user, :admin, 
      :name   => 'Admin',
      :email  => 'admin@example.com',
      :login  => 'admin',
      :password               => 'radiant',
      :password_confirmation  => 'radiant'
      
    create_model :user, :visitor,
      :name   => 'Visitor',
      :email  => 'visitor@example.com',
      :login  => 'visitor',
      :access => 'visitor',
      :password               => 'radiant',
      :password_confirmation  => 'radiant'
  end
  
end