class Api::V1::UsersController < ApplicationController

    def create
        
        begin
            user = User.new(user_params)
            user.save

        rescue StandardException => exception
            render json: {status: :bad_request, message: "Exception encountered: #{exception.messages}"}
        end
    end

    private
    def users_params
        params.require(:users).permit(:username, :email, :password)
    end
end
