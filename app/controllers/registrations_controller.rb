class RegistrationsController < Devise::RegistrationsController
  before_filter :update_sanitized_params, if: :devise_controller?

  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:name,:birthday, :email, :password, :password_confirmation,:image)}
    devise_parameter_sanitizer.for(:account_update) {|u| u.permit(:name,:birthday,:image, :email, :password, :password_confirmation, :current_password)}
  end

  

end
