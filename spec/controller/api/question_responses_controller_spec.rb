require 'rails_helper'

describe 'QuestionResponsesController', type: :request do
  context 'create' do
    it 'create and save question answer' do
      #Setup
      user = {name: 'Vanderlei', birthdate: 10/04/2001, email: 'vandeco@gmail.com',
      gender: 'masculino', street: '15 de outubro', number: 144, city: 'São paulo', country: 'Brasil'}
      question = 'Qual madeira eu posso utilizar para o forro ?'
      response = 'você pode utilizar pinus, logico antes tratado para nao apodrecer.'
      
      #Execution
      post api_users_path, params: user
      post api_question_posts_path, params: {question: question, user_id: User.last.id}
      user = {name: 'jaspion', birthdate: 10/04/2001, email: 'vdfdgco@gmail.com',
        gender: 'masculino', street: '13 de outubro', number: 144, city: 'São paulo', country: 'bolivia'}
      post api_users_path, params: user
      post api_question_responses_path, params: {response: response, question_posts_id: QuestionPost.last.id, user_id: User.last.id}
      
      

      #Expectations
      expect(QuestionPost.last.question).to include('posso')
      expect(QuestionResponse.last.response).to eq(response)
      expect(QuestionPost.last.id).to eq(QuestionResponse.last.question_posts_id) 
    end
  end
end