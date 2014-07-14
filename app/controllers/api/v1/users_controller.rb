module Api
  module V1
    class UsersController < ApplicationController

      respond_to :json
      skip_before_filter :authenticate!

      def index
        authenticate!
        @users = User.all
        respond_with :api, :v1, @users
      end

      def create
        @user = User.new(user_params)
        @user.save
        respond_with :api, :v1, @user
      end

      protected

      def user_params
        params.require(:user).permit(:email, :password, :first_name, :last_name)
      end

    end
  end
end