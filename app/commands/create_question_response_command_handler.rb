class CreateQuestionResponseCommandHandler
  
  attr_accessor :response, :question_id

  def initialize(response:, question_id:, user_id:)
    
    @user_id = user_id
    @response = response
    @question_id = question_id
  end

  def execute

    if QuestionPost.last.user_id != User.last.id
      QuestionResponse.new(response: @response, question_posts_id: @question_id, user_id: @user_id).save
    end
    QuestionResponse.last
  end
end