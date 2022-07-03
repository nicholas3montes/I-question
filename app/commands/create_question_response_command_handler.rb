class CreateQuestionResponseCommandHandler

  def execute(response_params, question_id)
    a = QuestionPost.find(question_id)
    QuestionResponse.new(response: response_params, question_post: question_id).save!
    QuestionResponse.last
  end
end