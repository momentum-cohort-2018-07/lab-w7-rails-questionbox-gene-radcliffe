class Api::V1::UsersController < ApplicationController
    skip_before_action :authenticate, only: :create
    def index
        @user =User.all
    end

    def create
        
        begin
            
            user = User.new(users_params)
            if !user.save
                render json: {status: :bad_request, message: user.errors.messages}
            end
            @user = user
            render 'api/v1/users/show'
        rescue StandardError => exception
            render json: {status: :bad_request, message: "Exception encountered: #{exception}"}
        end
    end

    private
    def users_params
        params.require(:user).permit(:username, :email, :password)
    end
end
