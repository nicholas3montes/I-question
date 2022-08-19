require 'rails_helper'

describe 'CreateQuestionPostCommand', type: :request do
  context 'initialize' do
    it 'create and save a question' do
      # Setup
      CreateUserCommand.new.execute(name: 'Rubens', birthdate: 15081890, email:'R0506@gmail.com',
        gender:'Masculino', street: '24 de abril', number: 8, city: 'Itaporã', country: 'Brasil')
      question = 'Quantos anos pode comungar ?'
      
      # Execution
      CreateQuestionPostCommand.new.execute(question: question, user_id: User.last.id)

      # Expectations
      expect(QuestionPost.last.question).to eq(question)
      expect(QuestionPost.last.question).to include('comungar')
    end    
  end
end