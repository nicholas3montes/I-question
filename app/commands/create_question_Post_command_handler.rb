class CreateQuestionPostCommandHandler
  #def initialize(question_params)
  #  @question = { question: question_params }
  #end

  def execute(question_params)
    QuestionPost.new(question: question_params).save
    QuestionPost.last
  end
end