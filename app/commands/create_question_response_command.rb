class CreateQuestionResponseCommand
  
  def execute(response:, question_id:, user_id:)
    
    CreateQuestionResponseCommandHandler.new(response: response, question_id: question_id, user_id: user_id).execute
  end
end