# Base Controller for All versions of APIs
#
#
class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token
  # skip_before_action :authenticate_user!

  before_action :authenticate_user_from_token!

  rescue_from ActiveRecord::RecordNotFound do
    handle_exception
  end if Rails.env.production?

  private

  # Authenticates user via authentication token
  def authenticate_user_from_token!
    authenticate_token || render_unauthorized
  end

  # Method to handle when an exception is occured
  # @param exception
  def handle_exception
    # notifier_options = { env: env }
    # ExceptionNotifier.notify_exception(exception, notifier_options)
    render json: { success: false, message: 'Something went wrong',
                   status: 500 }
  end

  def authenticate_token
    authenticate_with_http_token do |token, _options|
      # @user = User.find_by(authentication_token: token)
      @token = token
      @user = User.find_by(authentication_token: token)
    end
  end

  def render_unauthorized
    render json: { success: false,
                   message: I18n.t('session.invalid_token'),
                   status_code: StatusCodes['unauthorized'] }
  end
end
