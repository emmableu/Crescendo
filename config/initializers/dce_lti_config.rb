DceLti::Engine.setup do |lti|
  # "provider_*" attributes are used to describe this tool to the consumer,
  # where "consumer" is an LMS like Canvas. The defaults are below, uncomment
  # and modify as necessary or (ideally) configure via environment variables.
  lti.provider_title = (ENV['LTI_PROVIDER_TITLE'] || 'Lambda')
  lti.provider_description = (ENV['LTI_PROVIDER_DESCRIPTION'] || 'An autograder')

  # Set this to `true` to enable the form and URL-rewriting behavior that
  # allows for the creation of cookieless sessions. The default is `false`,
  # meaning we don't attempt to use cookieless sessions when a cookie cannot be
  # set - the session just fails.
  lti.enable_cookieless_sessions = true
  
  
  # The default post-auth redirect includes the session key and session id so
  # that we can instantiate a successful cookieless session if needed.
  lti.redirect_after_successful_auth = ->(controller) {
    session_key_name = Rails.application.config.session_options[:key]
    if controller.params[:question_id]
      Rails.application.routes.url_helpers.question_path(
        id: controller.params[:question_id],
        params: controller.params
      )
    else
      Rails.application.routes.url_helpers.root_path(
        session_key_name => controller.session.id
      )
    end
  }


  # The consumer_secret and consumer_key should be a lambda that will be
  # evaluated in the context of your application. You might use a service
  # object or model proper to find key and secret pairs. Example:
  #
  lti.consumer_secret = ->(launch_params) {
    result = Course.find_by(consumer_key: launch_params[:oauth_consumer_key])
    if result.nil?
      (ENV['LTI_CONSUMER_SECRET'] || 'consumer_secret')
    else
      result.consumer_secret
    end
  }
  lti.consumer_key = ->(launch_params) {
    puts 'FINDING CONSUMER KEY'
    puts launch_params
    puts launch_params[:oauth_consumer_key]
    result = Course.find_by(consumer_key: launch_params[:oauth_consumer_key])
    if result.nil?
      (ENV['LTI_CONSUMER_KEY'] || 'consumer_key')
    else
      result.consumer_key
    end
  }
  
  # lti.consumer_secret = (ENV['LTI_CONSUMER_SECRET'] || 'consumer_secret')
  # lti.consumer_key = (ENV['LTI_CONSUMER_KEY'] || 'consumer_key')



  # Simple function to pass all keys to the next page
  # TODO: This is only for testing, oauth data should be filtered.
  lti.copy_launch_attributes_to_session = %w|
  resource_link_title
  resource_link_description
  context_id
  context_type
  context_title
  launch_presentation_css_url
  launch_presentation_document_target
  launch_presentation_return_url
  tool_consumer_info_version
  tool_consumer_instance_guid
  tool_consumer_instance_name
  tool_consumer_instance_url
  tool_consumer_instance_contact_email
  lis_outcome_service_url
  |
  #   ext_outcome_data_values_accepted


  # `lti.copy_launch_attributes_to_session` is an array of attributes to copy
  # to the default rails session from the IMS::LTI::ToolProvider instance after
  # a successful launch. The default attributes are defined in
  # `DceLti::Engine.setup`, and the possible canvas-lms attributes are defined
  # in:
  #
  # https://github.com/instructure/ims-lti/blob/master/lib/ims/lti/launch_params.rb#L9
  # https://github.com/instructure/ims-lti/blob/master/lib/ims/lti/tool_provider.rb
  #
  # and in the spec as well:
  # http://www.imsglobal.org/LTI/v1p1p1/ltiIMGv1p1p1.html#_Toc330273026
  #
  # lti.copy_launch_attributes_to_session.push(:additional_attribute_to_capture)

  # The tool_config_extensions lambda runs before the XML Tool Provider config
  # is generated and gets two parameters:
  #
  # * controller - An instance of DceLti::ConfigsController
  # * tool_config - An instance of IMS::LTI::ToolConfig
  #
  # It allows you to config LMS-specific extensions. A common example for the
  # Canvas LMS is included below, see
  # https://github.com/instructure/ims-lti/blob/master/lib/ims/lti/extensions/canvas.rb
  # for more canvas-specific configuration options.

  lti.tool_config_extensions = ->(controller, tool_config) do
    tool_config.extend ::IMS::LTI::Extensions::Canvas::ToolConfig
    tool_config.canvas_domain!(controller.request.host)
    tool_config.canvas_privacy_public!
  end
end
