class ApplicationController < ActionController::Base
        # Prevent CSRF attacks by raising an exception.
        # For APIs, you may want to use :null_session instead.
        protect_from_forgery with: :exception


        rescue_from CanCan::AccessDenied do 
  	       redirect_to root_path, alert: "You are not authorized to access this section"
  	end

  	private

	def current_user
	  @current_user ||= User.find(session[:user_id]) if session[:user_id]
	end
	helper_method :current_user
end