require 'rails_helper'

describe 'LikeQuestionPostCommand', type: :service do

  context 'Validando um like' do

    it 'O like deve acontecer' do
      #Setup
      CreateUserCommand.new.execute(name: 'Julio', birthdate: 15081890, email:'julioNaGAita@gmail.com',
        gender:'Masculino', street: 'Andre branccati', number: 45, city: 'São Paulo', country: 'Brasil')
      question_ = 'Qual será minha vocação ?'
      question = CreateQuestionPostCommand.new.execute(question: question_, user_id: User.last.id)
      CreateUserCommand.new.execute(name: 'Roberto', birthdate: 15081890, email:'xebreu@gmail.com',
        gender:'Masculino', street: '24 de abril', number: 8, city: 'jundiai', country: 'Brasil')

      #Execution
      like = LikeQuestionPostCommand.new.execute(user_id: User.last.id, question_post_id: QuestionPost.last.id)
      
      #Expectations
      expect(React.last).to eq(like)
      expect(React.last.question_post_id).to eq(question.id)
    end
  
    it 'Like não pode acontecer' do
      #Setup
      CreateUserCommand.new.execute(name: 'Rubens', birthdate: 15081890, email:'R0506@gmail.com',
        gender:'Masculino', street: '24 de abril', number: 8, city: 'Itaporã', country: 'Brasil')
      question_ = 'Quantos anos pode comungar ?'
      CreateQuestionPostCommand.new.execute(question: question_, user_id: User.last.id)
      
      #Execution 
      LikeQuestionPostCommand.new.execute(user_id: User.last.id, question_post_id: QuestionPost.last.id)
        
      #Expectations
      expect(React.last).to eq(nil)
      expect(React.all).to eq([])
    end

    it 'Não pode haver dois likes do mesmo user para a mesma question post' do
      #setup
      CreateUserCommand.new.execute(name: 'Gabriel', birthdate: 15081890, email:'salele@gmail.com',
        gender:'Masculino', street: 'Salessopolistina', number: 45, city: 'São Paulo', country: 'Brasil')
      question_ = 'Qual será minha vocação ?'
      CreateQuestionPostCommand.new.execute(question: question_, user_id: User.last.id)
      user = CreateUserCommand.new.execute(name: 'Roberto', birthdate: 15081890, email:'xebreu@gmail.com',
        gender:'Masculino', street: '24 de abril', number: 8, city: 'jundiai', country: 'Brasil')

      LikeQuestionPostCommand.new.execute(user_id: User.last.id, question_post_id: QuestionPost.last.id)
      
      #execution
      like = LikeQuestionPostCommand.new.execute(user_id: User.last.id, question_post_id: QuestionPost.last.id)
    
      #Expectations
      expect(like).to eq(nil)
      expect(React.where(user_id: user.id).count).to eq(1)
    end
  end

  context 'Alterando um dislike para um like' do
    
    it 'Alteração é valida e acontece' do
      #Setup
      CreateUserCommand.new.execute(name: 'Catarina', birthdate: 11081990, email:'catarinaTDD@gmail.com',
        gender:'Feminino', street: 'Capadura', number: 12, city: 'São Paulo', country: 'Brasil')
      question_ = 'Como faço para ser freira ?'
      CreateQuestionPostCommand.new.execute(question: question_, user_id: User.last.id)
      CreateUserCommand.new.execute(name: 'Tawane', birthdate: 15081999, email:'Taw@gmail.com',
        gender:'Feminino', street: '12 de outubro', number: 888, city: 'Aparecida', country: 'Brasil')
      
      #Execution
      DislikeQuestionPostCommand.new.execute(user_id: User.last.id, question_post_id: QuestionPost.last.id)
      like = LikeQuestionPostCommand.new.execute(user_id: User.last.id, question_post_id: QuestionPost.last.id)

      #Expectations
      expect(React.all).to eq([like])
      expect(React.last.react).to eq('like')
    end
  end  
end

