require 'rails_helper'

describe 'DislikeQuestionPostCommand', type: :service do

  context 'Validando um dislike em uma question post' do
    it 'Validando dislike' do
      #Setup
      CreateUserCommand.new.execute(name: 'Galeano', birthdate: 15081890, email:'gaga@gmail.com',
        gender:'Masculino', street: 'São joão', number: 52, city: 'São Paulo', country: 'Brasil')
      question_ = 'Quantos anos tem a igreja catolica ?'
      question = CreateQuestionPostCommand.new.execute(question: question_, user_id: User.last.id)
      CreateUserCommand.new.execute(name: 'Carlinhos', birthdate: 15081890, email:'carlinho007@gmail.com',
        gender:'Masculino', street: '7 lagoas', number: 98, city: 'Bauru', country: 'Brasil')
      
      #Execution
      dislike = DislikeQuestionPostCommand.new.execute(user_id: User.last.id, question_post_id: QuestionPost.last.id)
      #Expectations
      expect(React.last).to eq(dislike)
      expect(React.last.question_post_id).to eq(question.id)
      expect(React.last.user_id).to eq(User.last.id)
    end
    
    it 'Dono da pergunta quer dar um dislike para ela' do
      #Setup
      CreateUserCommand.new.execute(name: 'Galeano', birthdate: 15081890, email:'gaga@gmail.com',
        gender:'Masculino', street: 'São joão', number: 52, city: 'São Paulo', country: 'Brasil')
      question_ = 'Quem vence as eleições de 2022 ?'
      CreateQuestionPostCommand.new.execute(question: question_, user_id: User.last.id)
      
      #Execution
      dislike = DislikeQuestionPostCommand.new.execute(user_id: User.last.id, question_post_id: QuestionPost.last.id)
      #Expectations
      expect(dislike).to eq(nil)
      expect(React.last).to eq(nil)
      expect(React.all).to eq([])
    end

    it 'Usuário tentando dar dois dislikes' do
      #setup
      CreateUserCommand.new.execute(name: 'Deivid', birthdate: 15081890, email:'salele@gmail.com',
        gender:'Masculino', street: 'cinco de outubro', number: 32, city: 'São Paulo', country: 'Brasil')
      question_ = 'Qual seu nome ?'
      CreateQuestionPostCommand.new.execute(question: question_, user_id: User.last.id)
      user = CreateUserCommand.new.execute(name: 'Kaka', birthdate: 15081890, email:'kk@gmail.com',
        gender:'Masculino', street: 'lakers', number: 147, city: 'Boston', country: 'Brasil')

      DislikeQuestionPostCommand.new.execute(user_id: User.last.id, question_post_id: QuestionPost.last.id)
      
      #execution
      dislike = DislikeQuestionPostCommand.new.execute(user_id: User.last.id, question_post_id: QuestionPost.last.id)
    
      #Expectations
      expect(dislike).to eq(nil)
      expect(React.where(user_id: user.id).count).to eq(1)
    end
  end
  context 'Alterando reação de like pelo dislike' do
    it 'A alteração acontece' do
      #Setup
      CreateUserCommand.new.execute(name: 'Galeano', birthdate: 15081890, email:'gaga@gmail.com',
        gender:'Masculino', street: 'São joão', number: 52, city: 'São Paulo', country: 'Brasil')
      question_ = 'Quantos anos tem a igreja catolica ?'
      question = CreateQuestionPostCommand.new.execute(question: question_, user_id: User.last.id)
      CreateUserCommand.new.execute(name: 'Carlinhos', birthdate: 15081890, email:'carlinho007@gmail.com',
        gender:'Masculino', street: '7 lagoas', number: 98, city: 'Bauru', country: 'Brasil')
      
      #Execution
      LikeQuestionPostCommand.new.execute(user_id: User.last.id, question_post_id: QuestionPost.last.id)
      dislike = DislikeQuestionPostCommand.new.execute(user_id: User.last.id, question_post_id: QuestionPost.last.id)
      
      #Expectations
      expect(React.all).to eq([dislike])
      expect(React.last.react).to eq('dislike')
    end
  end
end