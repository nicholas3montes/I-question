require 'rails_helper'

describe 'CreateQuestionResponseCommandHandler', type: :request do
  context 'execute' do
    it 'create and save a response for question' do
      # Setup
      CreateUserCommandHandler.new(name: 'Roberto', birthdate: 15081890, email:'Robertinhozika@gmail.com',
        gender:'Masculino', street: 'Clodomiro amazonas', number: 888, city: 'São paulo', country: 'Brasil').execute
      question = "Como fazer velas de cera de abelha ?"
      questionPost = QuestionPost.new(question: question, user_id: User.last.id).save
      CreateUserCommandHandler.new(name: 'Carlos', birthdate: 30011880, email:'Carlao@gmail.com',
        gender:'Masculino', street: 'Brigadeiro recheado', number: 58, city: 'São paulo', country: 'Brasil').execute
      response = "Olhando o manual, seu burro !"

      # Execution
      CreateQuestionResponseCommandHandler.new(response: response, question_id: QuestionPost.last.id, user_id: User.last.id).execute
      
      # Expectations
      expect(QuestionResponse.last.response).to eq(response)
      expect(QuestionPost.last.id).to eq(QuestionResponse.last.question_posts_id)
    end
  end
end