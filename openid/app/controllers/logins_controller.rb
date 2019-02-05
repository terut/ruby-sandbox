class LoginsController < ApplicationController
  def create
    if user = User.find_by(username: params[:username]).try(:authenticate, params[:password])
      session[:current_user_id] = user.id
      redirect_to root_path and return
    end 

    redirect_to login_path
  end
end
