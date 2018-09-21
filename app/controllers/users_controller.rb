class UsersController < ApplicationController
  # skip_before_action :authenticate
  def signup
  
  end
  def new
    puts "***********user new******!!!!"
    @uploader.update_attribute :avatar_key, params[:key]
  
    puts "***********user new******!!!!"
  end


  def create
    puts "***********user create******!!!!"
  end

  def index
  end

  def show
    
      if !session[:token]
       
        flash[:notice]= "You are not logged in"
        redirect_to welcome_index_path
      end
      @questions= get_all_user_questions
      @userprofile = get_userprofile
      

      @questions= @questions['questions']
  end
  protected

  def get_userprofile
   # /api/v1/users/profile/:id
    userid = session[:user_id]
    response = HTTParty.get("http://0.0.0.0:3007/api/v1/users/profile/#{userid}", headers: {"Authorization" => "Token token=\"#{session[:token]}\""})
    @userprofile = response.parsed_response
  end
  def get_all_user_questions
    # calls api/v1/users/:user_id/questions/user to get all questions for the user
    userid = session[:user_id]
    response = HTTParty.get("http://0.0.0.0:3007/api/v1/users/#{userid}/questions/user", headers: {"Authorization" => "Token token=\"#{session[:token]}\""})
    questions = response.parsed_response

  end
end
