module Api
  module V1
    class ApiKeysController < ApplicationController

      respond_to :json

      def index
        @api_keys = ApiKey.all
        respond_with @api_keys
      end

      def create

      end

    end
  end
end