module ApplicationHelper
  def cromby_version
    @cromby_version = PgProc.current_version()
    #We don't want the first row returned from the function as this is the header
    @cromby_version[1]
  end
end
