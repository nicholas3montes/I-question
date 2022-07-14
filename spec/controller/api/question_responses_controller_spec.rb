require 'rails_helper'

describe 'QuestionResponsesController', type: :request do
  context 'create' do
    it 'create and save question answer' do
      # Setup
      question = 'Qual madeira eu posso utilizar para o forro ?'
      response = 'você pode utilizar pinus, logico antes tratado para nao apodrecer.'

      # Execution
      post api_question_posts_path, params: {question:question}
      post api_question_responses_path, params: {response: response, question_posts_id: QuestionPost.last.id}
      
      # Expectations
      expect(QuestionPost.last.question).to include('posso')
      expect(QuestionResponse.last.response).to eq(response)
      expect(QuestionPost.last.id).to eq(QuestionResponse.last.question_posts_id) 
    end
  end
end