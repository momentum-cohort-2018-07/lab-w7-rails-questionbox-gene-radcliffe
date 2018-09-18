class ApplicationController < ActionController::Base
    include ActionController::HttpAuthentication::Token::ControllerMethods
    
    
    protected
    # def authenticate
    #   authenticate_or_request_with_http_token do |token, options|
    #     # Compare the tokens in a time-constant manner, to mitigate
    #     # timing attacks.
    #     User.find_by_auth_token(token)
    #   end
    # end

    def verified_user
      User.find_by auth_token: ActionController::HttpAuthentication::Token.token_and_options(request)[0]
    end
    def set_user
      begin
      @user = User.find(params[:user_id])
      rescue StandardError => e 
        render json: {status: :bad_request, message: "Error in looking for user: #{@user.errors.messages}"}
      end
    end
    def set_question
      
      @question = Question.find(params[:question_id])
  end 
end
