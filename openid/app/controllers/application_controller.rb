class ApplicationController < ActionController::Base
  helper_method :logged_in?, :current_user

  private

  def logged_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.find_by_id(session[:current_user_id])
  end
end
