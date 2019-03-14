class ApplicationController < ActionController::Base
  before_action :require_user
  
  helper_method :logged_in?, :current_user
  
  def logged_in?
    if session[:student_id]
      return true
    end
    return false
  end
  
  def current_user
    @current_user ||= Student.find(session[:student_id]) if session[:student_id]
    return @current_user
  end
  
  def require_user
    if !logged_in?
       flash[:notice] = "You must be logged in"
       redirect_to login_path
    end
  end  
end # class
