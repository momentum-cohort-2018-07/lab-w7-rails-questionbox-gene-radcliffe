class QuestionsController < ApplicationController
    skip_before_action :authenticate
    before_action :get_user_question, only: [:new, :show]
    
    def show
        
        @question
       
    end
    def new
    end
    def question
        render 'questions/new.html'
    end
    protected

    def get_user_question
       
        options = session[:token]
        id = params[:id]
        response = HTTParty.get("http://localhost:3007/api/v1/questions/#{id}", headers: {"Authorization" => "Token token=\"#{session[:token]}\""})
        @question = response.parsed_response
        
    end

end
