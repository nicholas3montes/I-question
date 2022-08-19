require 'rails_helper'

describe 'DislikeQuestionPostController', type: :request do
  context 'Reação de dislike na question post ' do
    it 'Dislike acontece' do
      #Setup
      user = CreateUserCommand.new.execute(name: 'nicholas', birthdate: 22/03/1998, email:'nicholasmontes0@gmail.com',
        gender:'masculino', street: 'são domingos', number: 8, city: 'São paulo', country: 'Brasil')
      question_ = 'Que horas posso rezar o angelus ?'
      question = CreateQuestionPostCommand.new.execute(question: question_, user_id: user.id)
      user_1 = CreateUserCommand.new.execute(name: 'Saulo', birthdate: 10/5/1978, email:'fbdh@gmail.com',
        gender:'masculino', street: 'gjkfgjkf', number: 53, city: 'São paulo', country: 'Brasil')
      
      #Execution
      post api_dislike_question_post_index_path, params: {question_post_id: QuestionPost.last.id, user_id: User.last.id}

      #Expectations
      expect(response).to have_http_status(201)
      expect(React.last.react).to eq("dislike")
      expect(React.last.user_id).to eq(user_1.id)
      expect(React.last.question_post_id).to eq(question.id)
      expect(user.id != React.last.user_id).to be(true)
    end
    it 'Dono do question post tenta dar um dislike na propria question post e não consegue' do
      #Setup
      user = CreateUserCommand.new.execute(name: 'Claudio', birthdate: 22/03/1998, email:'nicholasmontes0@gmail.com',
        gender:'masculino', street: 'são domingos', number: 8, city: 'São paulo', country: 'Brasil')
      question_ = 'Esse ano vai ter 13° ?'
      question = CreateQuestionPostCommand.new.execute(question: question_, user_id: user.id)
      
      #Execution
      post api_dislike_question_post_index_path, params: {question_post_id: QuestionPost.last.id, user_id: user.id}

      #Expectations
      expect(response).to have_http_status(201)
      expect(React.all).to eq([])
      
    end
  end
end