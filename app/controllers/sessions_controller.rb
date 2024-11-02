class SessionsController < ApplicationController

  before_action :redirect_if_logged_in, only: [:new, :create]
  before_action :require_login, only: [:destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:user][:name])

    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else 
      flash[:alert] = "Login failed, incorrect username or password"
      redirect_to new_session_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private 

  def redirect_if_logged_in 
    redirect_to root_path if logged_in?
  end

  def require_login
    redirect_to new_session_path unless logged_in?
  end
end
