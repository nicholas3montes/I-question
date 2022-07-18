require 'rails_helper'

describe 'CreateQuestionPostCommand', type: :request do
  context 'execute' do
    it 'create and save a question' do
      # Setup
      question = 'Quantos anos pode comungar ?'
      
      # Execution
      CreateQuestionPostCommand.new(question:question)

      # Expectations
      expect(QuestionPost.last.question).to eq(question)
      expect(QuestionPost.last.question).to include('comungar')

    end
  end
end