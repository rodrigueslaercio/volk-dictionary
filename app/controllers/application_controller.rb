class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  helper_method :logged_in_user, :logged_in?

  def logged_in_user
    @logged_in_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in? 
    logged_in_user.present?
  end
end
