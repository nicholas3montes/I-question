class Api::QuestionPostsController < Api::ApiController
  def create
    question = CreateQuestionPostCommandHandler.new.execute(question:params[:question])
    render status: 201, json: question
  end

  private
  def question_params
    params.require(:question_post).permit(:question)
  end
end