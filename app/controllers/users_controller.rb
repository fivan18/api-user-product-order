class UsersController < ApplicationController
    before_action :set_user, only: %i[show]
    before_action :authorize!

    def index
        @users = User.all

        render json: serializer.new(@users)
    end

    def show
        render json: serializer.new(@user)
    end

    private
    def set_user
        @user = User.find(params[:id])
    end

    def serializer
        UserSerializer
    end
end
  