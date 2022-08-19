require 'rails_helper'

describe 'CreateUserCommand', type: :service do
  context 'User creation' do
    it 'creating and saving the user' do
      # Setup
      rua = 'Bento XVI'
      numero = 54
      cidade = 'São paulo'
      pais = 'Brasil'
      nome = 'Larissa' 
      dataNascimento = 19/01/2000 
      email = 'larissamanoela@gmail.com' 
      sexo = 'Masculino'

      # Execution
      CreateUserCommand.new.execute(name:nome, birthdate:dataNascimento, email:email, gender:sexo, street:rua, number:numero, city:cidade, country:pais)

      # Expectations
      expect(User.last.gender).to eq(sexo)
      expect(User.last.email).to include('@gmail')
      expect(Address.last.city).to include('paulo')
    end
  end
end