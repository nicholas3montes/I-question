class CreateQuestionPostCommandHandler

  def execute(question:)

    CreateQuestionPostCommand.new(question:question)
    QuestionPost.last
  end
end