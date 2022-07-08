require 'rails_helper'

describe 'CreateUserCommandHandler', type: :request do
  context 'execute' do
    it 'creating and saving the user' do
      # Setup
      nome = 'nicholas' 
      dataNascimento = 22/03/1998 
      email = 'nicholasmontes0@gmail.com' 
      sexo = 'masculino'

      # Execution
      user = CreateUserCommandHandler.new.execute(nome, dataNascimento, email, sexo)
      
      # Expectations
      expect(User.last.sexo).to eq(sexo)
      expect(User.last.email).to include('@gmail')

    end
  end
end