module SessionHelper
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  def admin?
    return current_user.role == 'admin'
  end
  def user_name
    current_user.username if current_user
  end
end
