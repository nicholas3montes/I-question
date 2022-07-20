require 'rails_helper'

describe 'CreateQuestionPostCommandHandler', type: :request do
  context 'execute' do
    it 'create and save a question' do
      # Setup
      CreateUserCommandHandler.new.execute(name: 'claudia', birthdate: 15082000, email:'clau@gmail.com',
        gender:'feminino', street: '23 de maio', number: 8, city: 'São roque', country: 'Brasil')
      question = 'Como fabricar velas de cera de abelha ?'
      # Execution
      CreateQuestionPostCommandHandler.new.execute(question: question)

      # Expectations
      expect(QuestionPost.last.question).to eq(question)
      expect(QuestionPost.last.question).to include('cera')

    end
  end
end