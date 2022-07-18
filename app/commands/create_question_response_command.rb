class CreateQuestionResponseCommand
  
  def initialize(response:, question_id:)

    QuestionResponse.new(response: response, question_posts_id: question_id).save
  end
end