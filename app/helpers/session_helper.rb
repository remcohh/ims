module SessionHelper
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def sysadmin?
    return current_user.role == 1
  end
  
  def corporate_rm?
    return current_user.role == 2
  end
  
  def project_rm?
    return current_user.role == 3
  end
  
  def risk_creator?
    return current_user.role == 4
  end
  
  def risk_viewer?
    return current_user.role == 5
  end
    
  def user_name
    current_user.email if current_user
  end
  
  def check_sysadmin_corporate_rm?(user)
    current_user == user || (current_user.role == 2 && user.role == 1)
  end
end
