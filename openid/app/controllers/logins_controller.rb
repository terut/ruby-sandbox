class LoginsController < ApplicationController
  def create
    if user = User.find_by(username: params[:username]).try(:authenticate, params[:password])
      session[:current_user_id] = user.id
      uri = URI.parse(request.referer)
      return_to = Rack::Utils.parse_nested_query(uri.query).dig("return_to")
      redirect_to (return_to || root_path) and return
    end 

    redirect_to login_path
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to root_path
  end
end
