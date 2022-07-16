class Api::QuestionResponsesController < Api::ApiController
  def create
    response = CreateQuestionResponseCommandHandler.new.execute(response:params[:response], question_id:params[:question_posts_id])
    render status: 201, json: response
  end

  private
  def question_params
    params.require(:question_response).permit(:response)
  end
end

 