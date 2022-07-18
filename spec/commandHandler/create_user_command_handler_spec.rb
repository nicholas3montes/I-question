require 'rails_helper'

describe 'CreateUserCommandHandler', type: :request do
  context 'execute' do
    it 'creating and saving the user' do
      # Setup
      rua = 'São rafael'
      numero = 9
      cidade = 'São paulo'
      pais = 'Brasil'
      nome = 'Nicholas' 
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
      rua = 'king'
      numero = 14
      cidade = 'Cleveland city'
      pais = 'EUA'       
      nome = 'Jackson' 
      dataNascimento = 15/06/1959 
      email = 'michaeljackson0@gmail.com' 
      sexo = 'masculino'

      # Execution
      CreateUserCommandHandler.new.execute(name:nome, birthdate:dataNascimento, email:email, gender:sexo, street:rua, number:numero, city:cidade, country:pais)
      
      # Expectations
      expect(User.last.address_id).to eq(Address.last.id)
      expect(Address.last.city).to include('Cleveland')
      expect(Address.last.number).to eq(numero)

    end
  end
end