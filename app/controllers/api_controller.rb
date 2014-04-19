class ApiController < ApplicationController

  skip_before_action :verify_authenticy_token
  respond_to :json

end

# Work here comes from https://github.com/jamesotron/Blogomat/blob/master/app/controllers/api_controller.rb