class Api::V1::UsersController < ApplicationController
    skip_before_action :authenticate, only: [:create, :login]
    include ActionController::HttpAuthentication::Basic::ControllerMethods

    
    
    def index
        @user =User.all
    end

    def login
        authenticate_or_request_with_http_basic do |usersname, password|
            

             user = User.find_by_username(usersname)
         
            if user && user.authenticate(password) then
                render json: {user: {id: user.id, username: user.username, token: user.auth_token}}
             else 
                render json: {status: :unauthorized, message: "wrong"} 
            end
       end

    end

    def create
       
        user = User.new(users_params)
   
        begin
            
           
      
            if !user.save
                render :json => {
                    :status => :bad_request, 
                    :message => user.errors.messages}
            else
                 render :json =>{
                    :status => :ok,
                    :token => user.auth_token
    
                 }
            end        
          
        rescue StandardError => exception
            render json: {status: :bad_request, message: "Exception encountered: #{exception}"}
        end
    end

    protected
    def users_params
        params.require(:user).permit(:username, :email, :password)
      
    end
end
