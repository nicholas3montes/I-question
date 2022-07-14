require 'rails_helper'

describe 'CreateQuestionResponseCommandHandler', type: :request do
  context 'execute' do
    it 'create and save a response for question' do
      # Setup
      question = {question:"Como fazer velas de cera de abelha ?"}
      QuestionPost.new(question: question[:question]).save
      response = "Olhando o manual, seu burro !"

      # Execution

      saveResponse = CreateQuestionResponseCommandHandler.new.execute(response, QuestionPost.last.id)

      # Expectations
      expect(QuestionResponse.last.response).to eq(saveResponse.response)
      expect(QuestionPost.last.id).to eq(saveResponse.question_posts_id)
    end
  end
end