class Api::V1::QuestionsController < ApplicationController
    def create
        binding.pry
        question = Question.new(question_params)
        if question.save
            @question = question
            render 'api/v1/questions/show'
        else 
            render json: {status: :bad_request, message: question.errors.messages}
        end
    end
    private

    def question_params

        params.require(:question, :user_id).permit(:title, :body)
    end
end
