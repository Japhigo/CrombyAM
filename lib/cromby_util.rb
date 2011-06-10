#Miscellaneous methods to support helpers
module CrombyUtil

  #Returns the currently installed version of the Cromby Database
  def CrombyUtil.current_version
    cromby_version = PgProc.current_version()
    cromby_version[1]
  end

end
