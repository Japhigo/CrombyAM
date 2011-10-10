#Library module containing methods for use in authorization and authentication
module CrombyAuth

  include BCrypt
  
  #Generates a new salt for use in hashing passwords
  def CrombyAuth.new_salt
    BCrypt::Engine.generate_salt
  end

  #Hashes a password using the salt provided
  def CrombyAuth.encrypted_password(password, salt)
    BCrypt::Engine.hash_secret(password, salt)
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
    authorization[1]
  end

  #Get the user name for a user's UUID
  def CrombyAuth.user_name(user_uuid)
    user_name = PgProc.user_name(user_uuid)
    user_name[1]
  end

end
