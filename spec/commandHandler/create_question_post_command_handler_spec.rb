require 'rails_helper'

describe 'CreateQuestionPostCommandHandler', type: :request do
  context 'execute' do
    it 'create and save a question' do
      # Setup
      currentQuestion = "Como fabricar velas de cera de abelha ?"

      # Execution
      question = CreateQuestionPostCommandHandler.new.execute(currentQuestion)

      # Expectations
      expect(QuestionPost.last.question).to eq(currentQuestion)
      expect(QuestionPost.last.question).to include('cera')

    end
  end
end