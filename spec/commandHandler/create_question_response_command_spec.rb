require 'rails_helper'

describe 'CreateQuestionResponseCommand', type: :request do
  context 'execute' do
    it 'create and save a response' do
      #Setup
      CreateUserCommand.new(name:'guilherme', birthdate:22051998, email:'oioi@gmail.com', 
        gender:'masculino', street:'travessa rio', number:07, city:'Paraiba', country:'Brasil')
      QuestionPost.new(question:'Como fazer um bolo rapido ?', user_id:User.last.id).save
      response = 'batendo no liquidificador !'
      CreateUserCommand.new(name:'tatiana', birthdate:29091978, email:'tati@gmail.com', 
        gender:'feminino', street:'cuiabana', number:07, city:'Curitiba', country:'Brasil')
      #Execution
      CreateQuestionResponseCommand.new(response: response, question_id: QuestionPost.last.id)

      #Expectations
      expect(QuestionResponse.last.response).to eq(response)
      expect(QuestionPost.last.id).to eq(QuestionResponse.last.question_posts_id)

    end
  end
end