class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  include SessionHelper
  
  def authorize
    redirect_to login_url unless current_user
  end

  def only_admin
    redirect_to root_url unless admin?
  end
  
end
