class CreateQuestionPostCommand
  
  def initialize(question:)
    
    QuestionPost.new(question: question).save
  end
end