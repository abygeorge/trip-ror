module Api
  # Base Controller for v1 APIs
  #
  class BaseApiController < ApiController
    before_action :initialize_default_instance_vars

    private

    # To initialize the default intance vars
    def initialize_default_instance_vars
      @success = true
      @status_code = StatusCodes['ok']
      @message = ''
    end
  end
end
