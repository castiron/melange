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
          render :json => {:success => false, :errors => ["The email or password you entered is incorrect."]}, :status => 400
        end
      end

      def show
        @api_key = ApiKey.where(token: params[:id]).first
        respond_with :api, :v1, @api_key
      end

      protected

      def authenticate_params
        params.permit(:email, :password)
      end

    end
  end
end