module Api
  module V1
    class ApiKeysController < ApplicationController

      respond_to :json
      skip_before_filter :authenticate!

      def index
        authenticate!
        @api_keys = ApiKey.all
        respond_with @api_keys
      end

      def create
        credentials = authenticate_params
        user = User.authenticate(credentials[:email], credentials[:password], request.remote_ip)
        if user
          @api_key = user.api_keys.build({ip_address: request.remote_ip})
          @api_key.save
          respond_with :api, :v1, @api_key
        else
          render :json => {:errors => 'Your username or password were incorrect.'}, :status => 401
        end
      end

      protected

      def authenticate_params
        params.permit(:email, :password)
      end

    end
  end
end