class CreateQuestionResponseCommandHandler

  def execute(response:, question_id:)
    QuestionResponse.new(response: response, question_posts_id: question_id).save
    QuestionResponse.last
  end
end