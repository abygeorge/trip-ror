# AuthenticationService - authentication via mobile api
# params email and password
class AuthenticationService
  def initialize(params)
    @params = params
  end

  def call
    if @params[:email].present? && @params[:password].present?
      @user = User.find_for_database_authentication(email: @params[:email])
      if @user && @user.valid_password?(@params[:password])
        authentication_success
      else
        authentication_failure
      end
    else
      authentication_failure
    end
  end

  private

  # fetch profile image, banner image, set auth_token
  def authentication_success
    # add_devise_token
    { success: true, message: 'success', user: @user,
      status_code: StatusCodes['success'] }
  end

  # def add_devise_token
  #   # remove existing device token if app was remove without logout
  #   @user.remove_device_tokens(@params[:device_token])
  #   @user.add_device_token(@params[:device_token],
  #                          @params[:device_type]) if @params[:device_token]
  # end

  # authentication failure response
  def authentication_failure
    { success: false, message: 'invalid email or password',
      status_code: StatusCodes['invalid_inputs'] }
  end
end
