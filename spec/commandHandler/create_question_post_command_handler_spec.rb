require 'rails_helper'

describe 'CreateQuestionPostCommandHandler', type: :request do
  context 'execute' do
    it 'create and save a question' do
      # Setup
      question = 'Como fabricar velas de cera de abelha ?'
      # Execution
      CreateQuestionPostCommandHandler.new.execute(question:question)

      # Expectations
      expect(QuestionPost.last.question).to eq(question)
      expect(QuestionPost.last.question).to include('cera')

    end
  end
end