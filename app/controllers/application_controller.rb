class ApplicationController < ActionController::Base
  # protect_from_forgery with: :null_session
  # protected
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  # def devise_parameter_sanitizer
  #   if resource_class == User
  #     UserParameterSanitizer.new(User, :user, params)
  #   else
  #     super # Use the default one
  #   end
  # end

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  protect_from_forgery with: :null_session
  # helper_method :current_user, :require_admin

  # def current_user
  #   @current_user ||= User.find_by(id: session[:user_id])
  # end
  #
  # def require_admin
  #   return true if Rails.env.development?
  #
  #   if !current_user || (current_user && !current_user.admin)
  #     flash[:error] = "Visiting '#{request.fullpath}' requires an administrator account"
  #     redirect_to '/' and return
  #   end
  # end

  # We store the original request parameters in the session for use later on.
  # This allows us to re-create a tool provider instance whenever we need.
  # The TP instance could be used from any controller
  # TODO: There's probably a better place for this.
  def get_tool_provider
    @tool_provider ||= setup_tool_provider
  end
  #
  # # TODO: Better check for LTI?
  # def authenticate_via_lti
  #   puts 'app controller authenticate_via_lti called..'
  #   if ! current_user
  #     redirect_to Engine.routes.url_helpers.invalid_sessions_path
  #   end
  # end

  private

  def setup_tool_provider
    launch_params = session[:launch_params]
    return unless launch_params
    course = Course.find_by(consumer_key: launch_params[:oauth_consumer_key])
    return unless course # TODO: render invalid, and display error.
    IMS::LTI::ToolProvider.new(
      course.consumer_key, course.consumer_secret, launch_params
    )
  end
end
