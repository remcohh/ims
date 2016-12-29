class SessionController < ApplicationController
  before_action :logged_in, only: [:new, :create]
  
  def new
  end
  
  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to root_url
    else
      flash.now[:notice] = "Invalid email and password combination!"
      render 'new'
    end
  end
  def destroy
    session[:user_id] = nil
    redirect_to login_url
  end

  private
  def logged_in
    redirect_to root_url if current_user
  end
end
