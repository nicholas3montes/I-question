class CreateQuestionPostCommandHandler

  def execute(question:)
    
    QuestionPost.new(question: question).save
    QuestionPost.last
  end
end