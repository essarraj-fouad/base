class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery

  self.responder = Responder

  rescue_from CanCan::AccessDenied do |exception|
    access_denied! exception
  end

protected

  # Rails 4 permitted parameters for devise only controllers
  def configure_permitted_parameters
    devise_parameter_sanitizer.for :account_update do |user|
      user.permit :email, :password, :password_confirmation, :current_password, :username
    end

    devise_parameter_sanitizer.for :sign_in do |user|
      user.permit :login, :password, :remember_me
    end

    devise_parameter_sanitizer.for :sign_up do |user|
      user.permit :email, :password, :password_confirmation, :remember_me, :username
    end
  end

private

  # Called by activeadmin when authorization fails
  #
  # @param exception [StandardError
  def access_denied! exception
    redirect_to main_app.root_path, flash: { error: exception.message }
  end

  def requires_admin!
    authenticate_user!
    redirect_to '/' unless warden.user.admin?
  end

end
