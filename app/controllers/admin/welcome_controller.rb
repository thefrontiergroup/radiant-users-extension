class Admin::WelcomeController < ApplicationController
  
  def index
    redirect_to default_admin_path
  end
  
end