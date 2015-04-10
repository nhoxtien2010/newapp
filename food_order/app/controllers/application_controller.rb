class ApplicationController < ActionController::Base
before_action :set_locale
before_filter :configure_permitted_parameters, if: :devise_controller?

rescue_from CanCan::AccessDenied do |exception|
  redirect_to root_url, :alert => exception.message
end


 
def set_locale
  I18n.locale = session[:locale] || I18n.default_locale
end
protect_from_forgery with: :null_session

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.



  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:sign_up) << :gender
    devise_parameter_sanitizer.for(:sign_up) << :permission
  end
  
end
