class CreateQuestionPostCommandHandler

  def execute(question_params)
    QuestionPost.new(question: question_params).save
    QuestionPost.last
  end
end