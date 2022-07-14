class CreateQuestionPostCommandHandler

  def execute(question:)
    binding.pry
    QuestionPost.new(question: question).save
    QuestionPost.last
  end
end