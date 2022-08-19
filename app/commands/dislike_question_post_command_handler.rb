class DislikeQuestionPostCommandHandler
  
  attr_accessor :question_post_id, :user_id
  
  def initialize(user_id:, question_post_id:)

    @user_id = user_id
    @question_post_id = question_post_id
  end

  def execute
    
    if User.find(@user_id).id != QuestionPost.find(@question_post_id).user_id

      if React.where(user_id: @user_id, question_post_id: @question_post_id) == []

        React.new(question_post_id: @question_post_id, user_id: @user_id, react: 'dislike').save
        React.last
      elsif React.where(user_id: @user_id, question_post_id: @question_post_id)

        if React.find_by_user_id(@user_id).react == 'like'

          react = React.find_by_user_id(@user_id)
          react.update(react: 'dislike')
          React.last
        end
      end
    end
  end
end