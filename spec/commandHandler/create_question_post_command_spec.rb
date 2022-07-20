require 'rails_helper'

describe 'CreateQuestionPostCommand', type: :request do
  context 'execute' do
    it 'create and save a question' do
      # Setup
      CreateUserCommand.new(name: 'Rubens', birthdate: 15081890, email:'R0506@gmail.com',
        gender:'Masculino', street: '24 de abril', number: 8, city: 'Itaporã', country: 'Brasil')
      question = 'Quantos anos pode comungar ?'
      
      # Execution
      CreateQuestionPostCommand.new(question: question)

      # Expectations
      expect(QuestionPost.last.question).to eq(question)
      expect(QuestionPost.last.question).to include('comungar')

    end
  end
end