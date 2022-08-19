class DislikeQuestionPostCommand

  def execute(user_id:, question_post_id:)
    
    DislikeQuestionPostCommandHandler.new(user_id: user_id, question_post_id: question_post_id).execute
  end
end