class User < ActiveRecord::Base
  
  devise :database_authenticatable, :confirmable, :recoverable, :rememberable, :token_authenticatable, :validatable
  
  attr_accessor :login
  
  def login
    self[:username]
  end
  
  def login=(username)
    self[:username] = username
  end
  
  # Default Order
  default_scope           :order => 'name'
  
  # Associations
  belongs_to :created_by, :class_name => 'User'
  belongs_to :updated_by, :class_name => 'User'
  
  validates_presence_of   :name
  validates_presence_of   :class_name
  
  set_inheritance_column  :class_name
  
  before_validation       :set_class_name
  
  def has_role?(role)
    respond_to?("#{role}?") && send("#{role}?")
  end
  
  class << self
    def unprotected_attributes
      @unprotected_attributes ||= [:name, :email, :username, :login, :password, :password_confirmation, :locale, :class_name]
    end
    
    def unprotected_attributes=(array)
      @unprotected_attributes = array.map{|att| att.to_sym }
    end
    
    def find_for_authentication(conditions)
      login = conditions.delete(:login)
      find(:first, :conditions => ["username = ? OR email = ?", login, login])
    end
  end
  
  protected
    
  def password_required?
    new_record? || destroyed? || password.present? || password_confirmation.present?
  end
  
  def set_class_name
    self.class_name ||= "User"
  end
  
end