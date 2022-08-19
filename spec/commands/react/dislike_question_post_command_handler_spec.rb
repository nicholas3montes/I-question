require 'rails_helper'

describe 'DislikeQuestionPostCommandHandler', type: :service do

  context 'Validando um dislike em uma question post' do
    it 'Validando dislike' do
      #Setup
      CreateUserCommandHandler.new(name: 'Galeano', birthdate: 15081890, email:'gaga@gmail.com',
        gender:'Masculino', street: 'São joão', number: 52, city: 'São Paulo', country: 'Brasil').execute
      question_ = 'Quantos anos tem a igreja catolica ?'
      question = CreateQuestionPostCommandHandler.new(question: question_, user_id: User.last.id).execute
      CreateUserCommandHandler.new(name: 'Carlinhos', birthdate: 15081890, email:'carlinho007@gmail.com',
        gender:'Masculino', street: '7 lagoas', number: 98, city: 'Bauru', country: 'Brasil').execute
      
      #Execution
      dislike = DislikeQuestionPostCommandHandler.new(user_id: User.last.id, question_post_id: QuestionPost.last.id).execute
      #Expectations
      expect(React.last).to eq(dislike)
      expect(React.last.question_post_id).to eq(question.id)
      expect(React.last.user_id).to eq(User.last.id)
    end
    
    it 'Dono da pergunta quer dar um dislike para ela' do
      #Setup
      CreateUserCommandHandler.new(name: 'Galeano', birthdate: 15081890, email:'gaga@gmail.com',
        gender:'Masculino', street: 'São joão', number: 52, city: 'São Paulo', country: 'Brasil').execute
      question_ = 'Quem vence as eleições de 2022 ?'
      CreateQuestionPostCommandHandler.new(question: question_, user_id: User.last.id).execute
      
      #Execution
      dislike = DislikeQuestionPostCommandHandler.new(user_id: User.last.id, question_post_id: QuestionPost.last.id).execute
      #Expectations
      expect(dislike).to eq(nil)
      expect(React.last).to eq(nil)
      expect(React.all).to eq([])
    end

    it 'Usuário tentando dar dois dislikes' do
      #setup
      CreateUserCommandHandler.new(name: 'Deivid', birthdate: 15081890, email:'salele@gmail.com',
        gender:'Masculino', street: 'cinco de outubro', number: 32, city: 'São Paulo', country: 'Brasil').execute
      question_ = 'Qual seu nome ?'
      CreateQuestionPostCommandHandler.new(question: question_, user_id: User.last.id).execute
      user = CreateUserCommandHandler.new(name: 'Kaka', birthdate: 15081890, email:'kk@gmail.com',
        gender:'Masculino', street: 'lakers', number: 147, city: 'Boston', country: 'Brasil').execute

      DislikeQuestionPostCommandHandler.new(user_id: User.last.id, question_post_id: QuestionPost.last.id).execute
      
      #execution
      dislike = DislikeQuestionPostCommandHandler.new(user_id: User.last.id, question_post_id: QuestionPost.last.id).execute
    
      #Expectations
      expect(dislike).to eq(nil)
      expect(React.where(user_id: user.id).count).to eq(1)
    end
  end
  context 'Alterando reação de like pelo dislike' do
    it 'A alteração acontece' do
      #Setup
      CreateUserCommandHandler.new(name: 'Galeano', birthdate: 15081890, email:'gaga@gmail.com',
        gender:'Masculino', street: 'São joão', number: 52, city: 'São Paulo', country: 'Brasil').execute
      question_ = 'Quantos anos tem a igreja catolica ?'
      question = CreateQuestionPostCommandHandler.new(question: question_, user_id: User.last.id).execute
      CreateUserCommandHandler.new(name: 'Carlinhos', birthdate: 15081890, email:'carlinho007@gmail.com',
        gender:'Masculino', street: '7 lagoas', number: 98, city: 'Bauru', country: 'Brasil').execute
      
      #Execution
      LikeQuestionPostCommandHandler.new(user_id: User.last.id, question_post_id: QuestionPost.last.id).execute
      dislike = DislikeQuestionPostCommandHandler.new(user_id: User.last.id, question_post_id: QuestionPost.last.id).execute
      
      #Expectations
      expect(React.all).to eq([dislike])
      expect(React.last.react).to eq('dislike')
    end
  end
end