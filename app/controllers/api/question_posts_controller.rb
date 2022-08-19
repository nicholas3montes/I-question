class Api::QuestionPostsController < Api::ApiController
  def create
    question = CreateQuestionPostCommandHandler.new(question:params[:question], user_id:params[:user_id]).execute
    render status: 201, json: question
  end

  def index
    
    @question = QuestionPost.all
    render status: 201, json: @question
  end

  private
  def question_params
    params.require(:question_post).permit(:question)
  end
end