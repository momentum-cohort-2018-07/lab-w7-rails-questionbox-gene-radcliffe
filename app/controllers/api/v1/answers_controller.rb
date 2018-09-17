class Api::V1::AnswersController < ApplicationController
    
#/api/v1/users/:user_id/questions/:question_id/answers
    def create
       
        answer = Answer.new(answer_params)
        user = set_user
        question = user.questions.find(params[:question_id])
        answer = question.answers.new(answer_params)
        answer.user_id = user.id
      
        question.save
       
    end
    def show

    end
    def index
        #localhost:3000/api/v1/users/1/answers
        #localhost:3000/api/v1/questions/:question_id/answers
        #questions id must be a valid id related to a question


            @answers = Answer.find_by user_id: params[:user_id]  if params[:user_id] != nil
            @answers = Answer.where answerable_id: params[:question_id] if params[:question_id]!=nil
        
       
        render :json =>{
            :status => :ok,
            :message => @answers}
        # render 'api/v1/answers/index'
    end
  
    def answer_params
        params.require(:answer).permit(:title, :body)
    end
   
end
