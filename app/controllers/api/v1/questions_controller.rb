class Api::V1::QuestionsController < ApplicationController
 skip_before_action :authenticate, only: :index

    def index
        
        #/api/v1/questions (works for unauthenticated, will throw an exception if it only returns 1 question to the jbuilder) 
        @questions = Question.where user_id: params[:user_id] if params[:user_id] !=nil
        @questions = Question.all if params[:user_id] == nil
        render 'api/v1/questions/index.json'
    end

    def user
    end
    def create 
       # /api/v1/users/:user_id/questions --works
        question = Question.new(question_params)
        question.user = set_user
        if question.save
            @question = question
            render json: {status: :ok, message: "OK"}
        else 
            render json: {status: :bad_request, message: question.errors.messages}
        end
    end
    private

    def question_params
        params.require(:question).permit(:title, :body, :user_id)
    end
   
end
