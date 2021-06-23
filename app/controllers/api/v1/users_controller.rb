module Api
  module V1
    class UsersController < ApplicationController
      def new
        @user = User.new
      end

      def index
        @users = User.all
        render json: { status: 'SUCCESS', message: 'Loaded posts', data: @users }
      end

      def create
        @user = User.new(user_params)
        if @user.save
          redirect_to login_path
        else
          render 'new'
        end
      end

    private

      def user_params
        params.require(:user).permit(:name, :mail, :password, :password_confirmation)
      end
    end
  end
end
