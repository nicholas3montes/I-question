class RemoveReactQuestionPostCommandHandler
  attr_accessor :user_id, :question_post_id

  def initialize(user_id:, question_post_id:)
    
    @user_id = user_id
    @question_post_id = question_post_id
  end

  def execute

    React.where(user_id: @user_id, question_post_id: @question_post_id).destroy_all
  end
end