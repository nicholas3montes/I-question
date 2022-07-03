require 'rails_helper'

describe 'QuestionPostsController', type: :request do
  context 'create' do
    it 'create and save a question' do
      # Setup
      question = { question: "Que horas posso rezar o angelus ?" }
      
      # Execution
      post api_question_posts_path, params: question 

      # Expectations
      expect(response).to have_http_status(201)
      expect(QuestionPost.last.question).to include('angelus')
      expect(QuestionPost.last.question).to eq(question[:question])
    end
  end
end
