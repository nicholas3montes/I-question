require 'rails_helper'

describe 'CreateQuestionResponseCommand', type: :request do
  context 'execute' do
    it 'create and save a response' do
      #Setup
      Address.new(street: 'travessa rio', number: 07, city: 'Paraiba', country: 'Brasil').save
      User.new(name: 'guilherme', birthdate: 22051998, email: 'oioi@gmail.com', gender: 'masculino', address_id: Address.last.id).save
      QuestionPost.new(question: 'Como fazer um bolo rapido ?', user_id: User.last.id).save
      response = 'batendo no liquidificador !'
      User.new(name: 'tatiana', birthdate: 22051998, email: 'hello@hotmail.com', gender: 'feminino', address_id: Address.last.id).save
      
      #Execution
      CreateQuestionResponseCommand.new.execute(response: response, question_id: QuestionPost.last.id, user_id: User.last.id)

      #Expectations
      expect(QuestionResponse.last.response).to eq(response)
      expect(QuestionPost.last.id).to eq(QuestionResponse.last.question_posts_id)

    end
  end
end