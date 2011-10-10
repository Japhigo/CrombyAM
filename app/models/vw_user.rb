require 'cromby_auth'

class VwUser < ActiveRecord::Base

  validates :new_password, :confirmation => true
  attr_accessor :password, :old_password, :new_password, :new_password_confirmation, :user_uuid
  
  #attr_readonly :user_name, :user_uuid
  
  #validate :password_supplied
  
  before_save :get_new_salt_and_hash
  
  def self.authenticate(user_name, password)
    user = find_by_user_name(user_name)
    if user && user.password = CrombyAuth.encrypted_password(password, user.salt)
      user
    else
      user = nil
    end
  end

protected

  def get_new_salt_and_hash
    self.salt = CrombyAuth.new_salt
    self.hashed_password = CrombyAuth.encrypted_password(self.new_password, self.salt)
  end
  
end
