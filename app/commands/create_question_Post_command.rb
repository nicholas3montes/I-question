class CreateQuestionPostCommand
  
  def initialize(question:)
    
    QuestionPost.new(question: question, user_id: User.last.id).save
  end
end