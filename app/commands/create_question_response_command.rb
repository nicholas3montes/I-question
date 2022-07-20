class CreateQuestionResponseCommand
  
  def initialize(response:, question_id:)
  
    if QuestionPost.last.user_id != User.last.id
      QuestionResponse.new(response: response, question_posts_id: question_id, user_id: User.last.id).save
    end
  end
end