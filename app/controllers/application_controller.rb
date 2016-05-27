class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :update_sanitized_params, if: :devise_controller?

  private

  def authenticate_active_admin_user!
    authenticate_user!
    unless current_user.has_role? :admin
      flash[:alert] = "You are not authorized to access this resource!"
      if current_user.has_role? :igrac
        redirect_to dashboard_index_path
      end
    end
  end

  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation, :type_flag)}
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password) }
  end

end
