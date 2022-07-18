class CreateQuestionResponseCommandHandler

  def execute(response:, question_id:)

    CreateQuestionResponseCommand.new(response: response, question_id: question_id)
    QuestionResponse.last
  end
end