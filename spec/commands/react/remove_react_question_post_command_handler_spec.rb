require 'rails_helper'

describe 'RemoveReactQuestionPostCommandHandler', type: :service do

  context 'Validando remoção de reação do question post' do
    
    it 'A reação de like removida' do
      #Setup
      CreateUserCommandHandler.new(name: 'Jaqueline', birthdate: 15081890, email:'jaqueline@gmail.com',
        gender:'Feminino', street: 'Carlos borromeu', number: 05, city: 'São Paulo', country: 'Brasil').execute
      question_ = 'Quantas horas tem uma semana ?'
      question = CreateQuestionPostCommandHandler.new(question: question_, user_id: User.last.id).execute
      CreateUserCommandHandler.new(name: 'Roberto', birthdate: 15081890, email:'carlosM@gmail.com',
        gender:'Masculino', street: '13 de maio', number: 800, city: 'Bauru', country: 'Brasil').execute
      LikeQuestionPostCommandHandler.new(user_id: User.last.id, question_post_id: QuestionPost.last.id).execute
      
      #Execution
      RemoveReactQuestionPostCommandHandler.new(user_id: React.last.user_id, question_post_id: React.last.question_post_id).execute

      #Expectations
      expect(React.all).to eq([])
      expect(React.last).to eq(nil)
    end

    it 'A reação de dislike removida' do
      #Setup
      CreateUserCommandHandler.new(name: 'Jonathan', birthdate: 15081890, email:'jonathan@gmail.com',
        gender:'Masculino', street: 'Charles rosen', number: 41, city: 'São Paulo', country: 'Brasil').execute
      question_ = 'Qual o resultado do conclave ?'
      question = CreateQuestionPostCommandHandler.new(question: question_, user_id: User.last.id).execute
      CreateUserCommandHandler.new(name: 'Bebeto', birthdate: 15081890, email:'Betinho@gmail.com',
        gender:'Masculino', street: 'Caviar Roxo', number: 11, city: 'São paulo', country: 'Brasil').execute
      DislikeQuestionPostCommandHandler.new(user_id: User.last.id, question_post_id: QuestionPost.last.id).execute
      
      #Execution
      RemoveReactQuestionPostCommandHandler.new(user_id: React.last.user_id, question_post_id: React.last.question_post_id).execute

      #Expectations
      expect(React.all).to eq([])
      expect(React.last).to eq(nil)
    end
  end
end