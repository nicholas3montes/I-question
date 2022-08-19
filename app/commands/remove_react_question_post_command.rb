class RemoveReactQuestionPostCommand

  def execute(user_id:, question_post_id:)
    
    RemoveReactQuestionPostCommandHandler.new(user_id: user_id, question_post_id: question_post_id).execute
  end
end