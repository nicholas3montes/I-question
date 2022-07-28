require 'rails_helper'

describe 'ReactQuestionPostCommandHandler', type: :request do
  context 'like' do
    it 'liked the question and list of users who reacted' do
       #Setup
      CreateUserCommand.new(name: 'Rubens', birthdate: 15081890, email:'R0506@gmail.com',
        gender:'Masculino', street: '24 de abril', number: 8, city: 'Itaporã', country: 'Brasil')
      question = 'Quantos anos pode comungar ?'
      CreateQuestionPostCommand.new(question: question)
      CreateUserCommand.new(name: 'Claudio', birthdate: 10101994, email:'Clauclau@gmail.com',
        gender:'Masculino', street: '23 de setembro', number: 74, city: 'Itaporã', country: 'Brasil')
      
      # Execution
      ReactQuestionPostCommand.new.like(user_id: User.last.id, question_id: QuestionPost.last.id)
      lista = ReactQuestionPostCommand.new.likes

      # Expectations
      expect(QuestionPost.last.like).to eq(1)
      expect(QuestionPost.last.dislike).to eq(nil)
      expect(lista).to eq([User.last])
    end
  end
  context 'removelike' do
    it 'remove like from question' do
      # Setup
      CreateUserCommand.new(name: 'Rubens', birthdate: 15081890, email:'R0506@gmail.com',
        gender:'Masculino', street: '24 de abril', number: 8, city: 'Itaporã', country: 'Brasil')
      question = 'Quantos anos pode comungar ?'
      CreateQuestionPostCommand.new(question: question)
      CreateUserCommand.new(name: 'Claudio', birthdate: 10101994, email:'Clauclau@gmail.com',
        gender:'Masculino', street: '23 de setembro', number: 74, city: 'Itaporã', country: 'Brasil')
      
      # Execution 
      ReactQuestionPostCommand.new.like(user_id: User.last.id, question_id: QuestionPost.last.id)
      ReactQuestionPostCommand.new.removelike(user_id: User.last.id, question_id: QuestionPost.last.id)

      # Expectations
      expect(QuestionPost.last.like).to eq(0)
      expect(QuestionPost.last.dislike).to eq(nil)
    end
  end
  context 'dislikes' do
    it 'list of users who reacted' do
      # Setup
      CreateUserCommand.new(name: 'Robson', birthdate: 15081890, email:'R06@gmail.com',
        gender:'Masculino', street: '23 de maio', number: 888, city: 'Venceslau', country: 'Brasil')
      question = 'Quantos anos pode comungar, ou fazer a crisma ?'
      CreateQuestionPostCommand.new(question: question)
      CreateUserCommand.new(name: 'Valdo', birthdate: 10081994, email:'Val@gmail.com',
        gender:'Masculino', street: '7 de abril', number: 4, city: 'goiaboles', country: 'Brasil')
      
      # Execution
      ReactQuestionPostCommand.new.dislike(user_id: User.last.id, question_id: QuestionPost.last.id)
      
      lista = ReactQuestionPostCommand.new.dislikes

      # Expectations
      
      expect(ReactQuestionPostCommand.new.dislikes).to eq(lista)
    end
  end
end