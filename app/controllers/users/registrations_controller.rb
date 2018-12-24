# frozen_string_literal: true
class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: %i[create]
  before_action :configure_edit_params, only: %i[update]

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name])
  end

  def configure_edit_params
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name])
  end
end
