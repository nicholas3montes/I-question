class ReactQuestionPostCommandHandler

  def like(user_id:, question_id:)
    ReactQuestionPostCommand.new.like(user_id: user_id, question_id: question_id)
  end

  def removelike(user_id:, question_id:)
    ReactQuestionPostCommand.new.removelike(user_id: user_id, question_id: question_id)
  end

  def dislike(user_id:, question_id:)
    ReactQuestionPostCommand.new.dislike(user_id: user_id, question_id: question_id)
  end

  def removedislike(user_id:, question_id:)
    ReactQuestionPostCommand.new.removedislike(user_id: user_id, question_id: question_id)
  end

  def likes
    ReactQuestionPostCommand.new.likes
  end

  def dislikes
    ReactQuestionPostCommand.new.dislikes
  end
end