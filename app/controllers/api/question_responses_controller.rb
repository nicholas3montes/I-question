class Api::QuestionResponsesController < Api::ApiController
  def create
    question_response = CreateQuestionResponsePostCommandHandler.new.execute(params[:response], QuestionPost.last.id)
    render status: 201, json: question_response
  end

  private
  def question_params
    params.require(:question_response).permit(:response)
  end
end

 