require 'rails_helper'

describe 'CreateQuestionPostCommand', type: :request do
  context 'initialize' do
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

  context 'dislike' do
    it 'dislike the question' do
      # Setup
      CreateUserCommand.new(name: 'Rubens', birthdate: 15081890, email:'R0506@gmail.com',
        gender:'Masculino', street: '24 de abril', number: 8, city: 'Itaporã', country: 'Brasil')
      question_ = 'Quantos anos pode comungar ?'
      question = CreateQuestionPostCommand.new(question: question_)
      CreateUserCommand.new(name: 'Claudio', birthdate: 10101994, email:'Clauclau@gmail.com',
        gender:'Masculino', street: '23 de setembro', number: 74, city: 'Itaporã', country: 'Brasil')
      
      # Execution
      question.like(user_id: User.last.id)
      question.dislike(user_id: User.last.id)
      question.dislike(user_id: User.last.id)
      question.dislike(user_id: User.last.id)

      # Expectations
      expect(QuestionPost.last.like).to eq(0)
      expect(QuestionPost.last.dislike).to eq(1)
    end
    it 'remove dislike from question' do
      # Setup
      CreateUserCommand.new(name: 'Rubens', birthdate: 15081890, email:'R0506@gmail.com',
        gender:'Masculino', street: '24 de abril', number: 8, city: 'Itaporã', country: 'Brasil')
      question_ = 'Quantos anos pode comungar ?'
      question = CreateQuestionPostCommand.new(question: question_)
      CreateUserCommand.new(name: 'Claudio', birthdate: 10101994, email:'Clauclau@gmail.com',
        gender:'Masculino', street: '23 de setembro', number: 74, city: 'Itaporã', country: 'Brasil')
      
      # Execution
      question.like(user_id: User.last.id)
      question.dislike(user_id: User.last.id)
      question.removedislike(user_id: User.last.id)

      # Expectations
      expect(QuestionPost.last.like).to eq(0)
      expect(QuestionPost.last.dislike).to eq(0)
    end
  end
end