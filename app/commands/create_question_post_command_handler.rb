class CreateQuestionPostCommandHandler
  
  attr_accessor :question, :user_id
  
  def initialize(question:, user_id:)

    @question = question
    @user_id = user_id    
  end

  def execute
    
    QuestionPost.new(question: question, user_id: user_id).save
    QuestionPost.last
  end
end