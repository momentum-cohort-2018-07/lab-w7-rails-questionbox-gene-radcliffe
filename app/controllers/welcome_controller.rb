
class WelcomeController < ApplicationController
#  skip_before_action :authenticate
 
def index
    if session[:user_id]==nil
        
        questions =get_all_answers_unauth
        @questions= questions['questions']
        
    end

    if session[:user_id]!=nil
       
      questions =get_all_answers_unauth
      @questions= questions['questions']
      
    end
   
  end

  private

  def get_all_answers_unauth
 
    response = HTTParty.get('http://0.0.0.0:3007/api/v1/questions',timeout:30)
    #response = HTTParty.get('http://localhost:3000/api/v1/questions',timeout:5) 
    questions = response.parsed_response
end

end
