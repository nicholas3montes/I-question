require 'rails_helper'

describe 'CreateQuestionResponseCommandHandler', type: :request do
  context 'execute' do
    it 'create and save a response for question' do
      # Setup
      CreateUserCommandHandler.new.execute(name: 'Roberto', birthdate: 15081890, email:'Robertinhozika@gmail.com',
        gender:'Masculino', street: 'Clodomiro amazonas', number: 888, city: 'São paulo', country: 'Brasil')
      question = "Como fazer velas de cera de abelha ?"
      questionPost = QuestionPost.new(question: question, user_id: User.last.id).save
      CreateUserCommandHandler.new.execute(name: 'Carlos', birthdate: 30011880, email:'Carlao@gmail.com',
        gender:'Masculino', street: 'Brigadeiro recheado', number: 58, city: 'São paulo', country: 'Brasil')
      response = "Olhando o manual, seu burro !"

      # Execution
      saveResponse = CreateQuestionResponseCommandHandler.new.execute(response: response, question_id: QuestionPost.last.id)

      # Expectations
      expect(QuestionResponse.last.response).to eq(saveResponse.response)
      expect(QuestionPost.last.id).to eq(saveResponse.question_posts_id)
    end
  end
end