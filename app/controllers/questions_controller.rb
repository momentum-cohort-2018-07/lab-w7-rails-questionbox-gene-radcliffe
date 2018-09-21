class QuestionsController < ApplicationController
    # skip_before_action :authenticate
    before_action :get_user_question, only: [:new, :show]
    
    def show
        
        @question
    
    end
    def new
    end
    def destroy
       
        @questions =destroy_question
        if @questions["message"].to_s == "deleted"
            flash[:notice] = "Message Deleted Succesfully"
        # else
        #     flash[:notice] = "Deletion Failed"
        end
    end
    def edit
        @question = get_user_question
        @question = @question['question']
    end

    def question
        render 'questions/new.html'
    end
    protected

    def get_user_question
       
        options = session[:token]
        id = params[:id]
        response = HTTParty.get("http://localhost:3007/api/v1/questions/#{id}", headers: {"Authorization" => "Token token=\"#{session[:token]}\""})
        @questions = response.parsed_response
        
    end
    def destroy_question
       
        options = session[:token]
        id = params[:format]                    
        response = HTTParty.delete("http://localhost:3007/api/v1/questions/#{id}", headers: {"Authorization" => "Token token=\"#{session[:token]}\""})
        @questions = response.parsed_response
        
    end

end
