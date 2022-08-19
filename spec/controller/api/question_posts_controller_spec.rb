require 'rails_helper'

describe 'QuestionPostsController', type: :request do
  context 'create' do
    it 'create and save a question' do
      #Setup
      CreateUserCommand.new.execute(name: 'nicholas', birthdate: 22/03/1998, email:'nicholasmontes0@gmail.com',
        gender:'masculino', street: 'são domingos', number: 8, city: 'São paulo', country: 'Brasil')
      question = 'Que horas posso rezar o angelus ?'
      
      #Execution
      post api_question_posts_path, params: {question: question, user_id: User.last.id}
      
      #Expectations
      expect(response).to have_http_status(201)
      expect(QuestionPost.last.question).to include('angelus')
      expect(QuestionPost.last.question).to eq(question)
    end
  end
end
