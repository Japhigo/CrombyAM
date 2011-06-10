#Library module containing methods for use in authorization and authentication
module CrombyAuth

  #Authenticates a user
  #Given a user's username, password and salt, returns the user's UUID if valid
  def CrombyAuth.user_uuid(user_name, password, salt)
     user_uuid = PgProc.authenticate_user(user_name, self.encrypted_password(password, salt))
     user_uuid[1]
  end
  
  #Generates a new salt for use in hashing passwords
  def CrombyAuth.new_salt
    (1..512).collect { (i = Kernel.rand(62); i += ((i < 10) ? 48 : ((i < 36) ? 55 : 61 ))).chr }.join
  end

  #Hashes a password using the salt provided
  def CrombyAuth.encrypted_password(password, salt)
    string_to_hash = "#{password}oojamaflip#{salt}"
    Digest::SHA512.hexdigest(string_to_hash)
  end

  #Strip off brackets from returned values and split into an array
  #Warning: as PostgreSQL delimits by commas, commas in strings could cause incorrect data to be returned
  def CrombyAuth.format_results(result)
    result.chomp!(")").reverse!.chomp!("(").reverse!.split(",")
  end

  #Validate a user's UUID and check permissions to use a controller
  #Returns the user name if a valid UUID and the value 1 if the user has permission
  def CrombyAuth.authorize_user(user_uuid, rails_controller_name)
    authorization = PgProc.authorize_user(user_uuid, rails_controller_name)
    CrombyAuth.format_results(authorization[1])
  end

  #Get the user name for a user's UUID
  def CrombyAuth.user_name(user_uuid)
    user_name = PgProc.user_name(user_uuid)
    user_name[1]
  end

end
