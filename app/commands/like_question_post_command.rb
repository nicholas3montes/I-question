class LikeQuestionPostCommand
  
  def execute(user_id:, question_post_id:)
    
    LikeQuestionPostCommandHandler.new(user_id: user_id, question_post_id: question_post_id).execute
  end
end