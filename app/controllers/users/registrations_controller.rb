class Users::RegistrationsController < Devise::RegistrationsController
  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: %I[email favorite_novel password password_confirmation])
  end
end