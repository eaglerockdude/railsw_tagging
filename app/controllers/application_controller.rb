class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # expose some methods as helpers to make globally available:

  helper_method :current_user, :logged_in? , :require_login

  # cach our current_user value for performance ie only get once(memoization)
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user  # !! turns into a boolean ..to preclude nil case
  end

  def require_login
    if !logged_in?
      flash[:error] = "Tealeaf login/authentication practice on my end ... sorry ... register or login to post."
      redirect_to root_path
    end
  end

end
