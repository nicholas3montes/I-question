class CreateQuestionResponseCommandHandler

  def execute(response_params, question_id)
    QuestionResponse.new(response: response_params, question_posts_id: question_id).save
    QuestionResponse.last
  end
end