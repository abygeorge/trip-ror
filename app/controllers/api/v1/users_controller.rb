module Api
  module V1
    #
    class UsersController < Api::BaseApiController
      skip_before_action :authenticate_user_from_token!, only: [:create, :authenticate]

      def create
        @user = User.create(user_params)
        @message = if @user.errors.any?
                      @success = false
                      @user.errors.full_messages.join(',')
                   else
                     'User successfully created'
                   end
      end

      # user authentication
      def authenticate
        p params
        @response = AuthenticationService.new(params).call
        @user = @response[:user]
        @success = @response[:success]
        @message = @response[:message]
        @status_code = @response[:status_code]
      end

      private

      def user_params
        params[:user].permit(:email, :password, :password_confirmation)
      end
    end
  end
end
