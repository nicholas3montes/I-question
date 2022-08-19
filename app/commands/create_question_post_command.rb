class CreateQuestionPostCommand

  def execute(question:, user_id:)
    
    CreateQuestionPostCommandHandler.new(question: question, user_id: user_id).execute
  end
end