class Api::V1::UsersController < ApiController
    skip_before_action :authenticate, only: [:create, :login]
    include ActionController::HttpAuthentication::Basic::ControllerMethods

    
    
    def index
        @user =User.all
    end

    def login
       authenticate_or_request_with_http_basic do |username, password|
             user = User.find_by username: username
             if user && user.authenticate(password) then
                render json: {user: {id: user.id, username: user.username, token: auth_token}}
             else 
                render json: {status: :unauthorized, message: "wrong"} 
            end
       end

    end

    def create
        
        begin
            
            user = User.new(users_params)
            if !user.save
                render json: {status: :bad_request, message: user.errors.messages}
            else
                @user = user
                render 'api/v1/users/show'
            end
            
        rescue StandardError => exception
            render json: {status: :bad_request, message: "Exception encountered: #{exception}"}
        end
    end

    private
    def users_params
        params.require(:user).permit(:username, :email, :password)
    end
end
