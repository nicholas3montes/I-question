require 'rails_helper'

describe 'CreateUserCommandHandler', type: :request do
  context 'execute' do
    it 'creating and saving the user' do
      # Setup
      rua = 'são joao'
      numero = 9
      cidade = 'São paulo'
      pais = 'Brasil'
      nome = 'nicholas' 
      dataNascimento = 22/03/1998 
      email = 'nicholasmontes0@gmail.com' 
      sexo = 'masculino'

      # Execution
      CreateUserCommandHandler.new.execute(name:nome, birthdate:dataNascimento, email:email, 
        gender:sexo, street:rua, number:numero, city:cidade, country:pais)
      
      # Expectations
      expect(User.last.gender).to eq(sexo)
      expect(User.last.email).to include('@gmail')

    end

    it 'creating and saving the address for user' do
      # Setup
      rua = 'são joao'
      numero = 9
      cidade = 'São paulo'
      pais = 'Brasil'       
      nome = 'nicholas' 
      dataNascimento = 22/03/1998 
      email = 'nicholasmontes0@gmail.com' 
      sexo = 'masculino'

      # Execution
      CreateUserCommandHandler.new.execute(name:nome, birthdate:dataNascimento, email:email, gender:sexo, street:rua, number:numero, city:cidade, country:pais)
      
      # Expectations
      expect(User.last.address_id).to eq(Address.last.id)
      expect(Address.last.city).to include('paulo')
      expect(Address.last.number).to eq(numero)

    end
  end
end