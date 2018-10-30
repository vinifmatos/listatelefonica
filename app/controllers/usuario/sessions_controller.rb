# frozen_string_literal: true

class Usuario::SessionsController < Devise::SessionsController
  skip_before_action :acesso_cadastro?
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    super
    flash.clear
  end

  # DELETE /resource/sign_out
  def destroy
    super
    flash.clear
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
