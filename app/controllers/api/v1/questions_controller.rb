class Api::V1::QuestionsController < ApiController
 
    def index
        
        @questions = Question.all
    end

    
    def create
        
        question = Question.new(question_params)
        question.user = set_user
        if question.save
            @question = question
            render 'api/v1/questions/show'
        else 
            render json: {status: :bad_request, message: question.errors.messages}
        end
    end
    private

    def question_params
    
        
        params.require(:question).permit(:title, :body, :user_id)
    end
    def set_user
        @user = User.find(params[:user_id])
    end
end
