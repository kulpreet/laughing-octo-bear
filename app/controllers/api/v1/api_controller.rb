module Api::V1
  class ApiController < ApplicationController
    def current_resource_owner
      User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
    end
    
    private
    
    def current_user
      @current_user ||= User.find(doorkeeper_token[:resource_owner_id])
    end

  end
end
