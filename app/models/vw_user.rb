require 'cromby_auth'

class VwUser < ActiveRecord::Base

  def self.authenticate(user_name, password)
    user = self.find_by_user_name(user_name)
    if user
      if CrombyAuth.user_uuid(user_name, password, user.salt)
        user
      else
        user = nil
      end
    end
  end

protected

  def get_new_salt_and_hash
    self.salt = CrombyAuth.new_salt
    self.hashed_password = CrombyAuth.encrypted_password(self.new_password, self.salt)
  end

end
