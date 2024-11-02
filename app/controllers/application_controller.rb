class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  helper_method :logged_in_user

  def logged_in_user
    @logged_in_user ||= session[:user_id] && User.find_by(id: session[:user_id])
  end

end
