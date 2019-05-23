# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  include Accessible
  skip_before_action :check_user, only: :destroy
  # def sign_in_params
  #   params.require(:user).permit(:username, :password)
  # end
  # generated_password = "123456"
  # s_hash = sign_in_params.to_hash()
  # s_hash["password"] = generated_password
  # sign_in_params = ActionController::Parameters.new(s_hash).permit(:username, :password)

  # User.find_for_database_authentication()
  # GET /resource/sign_in
  # def new
  #   generated_password = "123456"
  #   s_hash = sign_in_params.to_hash()
  #   s_hash["password"] = generated_password
  #   sign_in_params = ActionController::Parameters.new(s_hash).permit(:username, :password)
  #   # print('sign_in_params: ,', sign_in_params)
  #   self.resource = resource_class.new(sign_in_params)
  #   clean_up_passwords(resource)
  #   yield resource if block_given?
  #   respond_with(resource, serialize_options(resource))
  # end

  # POST /resource/sign_in

  # def create
  #   # User.create_with_password(users_params)
  #   # userinfo = auth_options.to_hash()
  #   # userinfo[:scope]["password"] = "123456"
  #   # auth_options= userinfo
  #   print('in create')
  #   print('auth_options: ', auth_options)
  #   print('auth_options_type: ', auth_options.class)
  #   print('auth_options_scopt_type: ', auth_options[:scope].class)
  #
  #   print('    auth_options[:scope][:username]_type: ',    auth_options[:scope]["username"].class)
  #
  #   super
  #   print('auth_options: ', auth_options)
  # end


  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
