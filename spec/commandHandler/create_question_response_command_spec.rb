require 'rails_helper'

describe 'CreateQuestionResponseCommand', type: :request do
  context 'execute' do
    it 'create and save a response' do
      #Setup
      QuestionPost.new(question:'Como fazer um bolo rapido ?').save
      response = 'batendo no liquidificador !'

      #Execution
      CreateQuestionResponseCommand.new(response: response, question_id: QuestionPost.last.id)

      #Expectations
      expect(QuestionResponse.last.response).to eq(response)
      expect(QuestionPost.last.id).to eq(QuestionResponse.last.question_posts_id)

    end
  end
end