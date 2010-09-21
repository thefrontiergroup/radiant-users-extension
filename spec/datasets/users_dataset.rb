class UsersDataset < Dataset::Base
  
  def load
    create_record :user, 'admin', 
  end
  
end