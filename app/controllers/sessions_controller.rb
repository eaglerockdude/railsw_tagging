class SessionsController < ApplicationController

  def new
  end

  def create

    user = User.find_by_email(params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Welcome  #{user.email},  you've logged in."
      redirect_to root_path
    else
      flash[:error] = "Unable to authenticate this ID and password.  Please try again."
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You are logged out."
    redirect_to root_path
  end

end
