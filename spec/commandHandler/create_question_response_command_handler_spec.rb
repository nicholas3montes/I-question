require 'rails_helper'

describe 'CreateQuestionResponseCommandHandler', type: :request do
  context 'execute' do
    it 'create and save a response for question' do
      # Setup
      question = QuestionPost.create!(question:"Como fazer velas de cera de abelha ?")
      response = "Olhando o manual, seu burro !"

      # Execution

      saveResponse = CreateQuestionResponseCommandHandler.new.execute(response, question.id)

      # Expectations
      expect(QuestionResponse.last.response).to eq(saveResponse)

    end
  end
end