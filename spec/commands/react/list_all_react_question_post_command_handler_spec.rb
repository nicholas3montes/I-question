require 'rails_helper'

describe 'ListAllReactQuestionPostCommandHandler', type: :request do
  context 'Listando somente reações de likes' do
    it 'Três likes acontecem e são listados' do
      #Setup
      CreateUserCommand.new.execute(name: 'nicholas', birthdate: 22/03/1998, email:'nicholasmontes0@gmail.com',
        gender:'masculino', street: 'são domingos', number: 8, city: 'São paulo', country: 'Brasil')
      question_ = 'Que horas posso rezar o angelus ?'
      question = CreateQuestionPostCommand.new.execute(question: question_, user_id: User.last.id)
      CreateUserCommand.new.execute(name: 'Saulo', birthdate: 10/5/1978, email:'fbdh@gmail.com',
        gender:'masculino', street: 'gjkfgjkf', number: 53, city: 'São paulo', country: 'Brasil')
      like = LikeQuestionPostCommand.new.execute(user_id: User.last.id, question_post_id: QuestionPost.last.id)
  
      CreateUserCommand.new.execute(name: 'Saulo', birthdate: 10/5/1978, email:'fbdh@gmail.com',
        gender:'masculino', street: 'gjkfgjkf', number: 53, city: 'São paulo', country: 'Brasil')
      LikeQuestionPostCommand.new.execute(user_id: User.last.id, question_post_id: QuestionPost.last.id)

      CreateUserCommand.new.execute(name: 'Saulo', birthdate: 10/5/1978, email:'fbdh@gmail.com',
        gender:'masculino', street: 'gjkfgjkf', number: 53, city: 'São paulo', country: 'Brasil')
      LikeQuestionPostCommand.new.execute(user_id: User.last.id, question_post_id: QuestionPost.last.id)
      #Execution
      lista = ListAllReactQuestionPostCommandHandler.new.execute
      
      #Expectations
      expect(lista).to eq(React.all)
      expect(lista[0]).to eq(like)
      expect(lista.count).to eq(3)
    end

    it 'Três dislikes acontecem e são listados' do
      #Setup
      CreateUserCommand.new.execute(name: 'nicholas', birthdate: 22/03/1998, email:'nicholasmontes0@gmail.com',
        gender:'masculino', street: 'são domingos', number: 8, city: 'São paulo', country: 'Brasil')
      question_ = 'Que horas posso rezar o angelus ?'
      question = CreateQuestionPostCommand.new.execute(question: question_, user_id: User.last.id)
      CreateUserCommand.new.execute(name: 'Saulo', birthdate: 10/5/1978, email:'fbdh@gmail.com',
        gender:'masculino', street: 'gjkfgjkf', number: 53, city: 'São paulo', country: 'Brasil')
      dislike = DislikeQuestionPostCommand.new.execute(user_id: User.last.id, question_post_id: QuestionPost.last.id)
  
      CreateUserCommand.new.execute(name: 'Saulo', birthdate: 10/5/1978, email:'fbdh@gmail.com',
        gender:'masculino', street: 'gjkfgjkf', number: 53, city: 'São paulo', country: 'Brasil')
      DislikeQuestionPostCommand.new.execute(user_id: User.last.id, question_post_id: QuestionPost.last.id)

      #Execution
      lista = ListAllReactQuestionPostCommandHandler.new.execute
      
      #Expectations
      expect(lista[0]).to eq(dislike)
      expect(lista.count).to eq(2)
    end
  end
end