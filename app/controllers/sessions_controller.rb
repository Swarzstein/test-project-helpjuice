class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.order("RANDOM()").first
    session[:user_id] = user.id
    redirect_to root_url, notice: "Welcome #{user.name}!"
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_url, notice: "See you soon!"
  end
end
