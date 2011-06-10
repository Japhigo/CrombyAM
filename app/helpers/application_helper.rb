require 'cromby_util'

module ApplicationHelper
  def cromby_version
    @cromby_version ||= CrombyUtil.current_version
  end
end
