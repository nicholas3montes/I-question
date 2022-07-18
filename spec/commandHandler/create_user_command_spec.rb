require 'rails_helper'

describe 'CreateUserCommand', type: :request do
  context 'initialize' do
    it 'creating and saving the user' do
      # Setup
      rua = 'Bento XVI'
      numero = 54
      cidade = 'São paulo'
      pais = 'Brasil'
      nome = 'Larissa' 
      dataNascimento = 19/01/2000 
      email = 'larissamanoela@gmail.com' 
      sexo = 'masculino'

      # Execution
      CreateUserCommand.new(name:nome, birthdate:dataNascimento, email:email, 
        gender:sexo, street:rua, number:numero, city:cidade, country:pais)
      
      # Expectations
      expect(User.last.gender).to eq(sexo)
      expect(User.last.email).to include('@gmail')

    end

    it 'creating and saving the address for user' do
      # Setup
      rua = 'São pedro'
      numero = 95
      cidade = 'São paulo'
      pais = 'Brasil'       
      nome = 'Pablo' 
      dataNascimento = 30/10/1992 
      email = 'pablomaia@gmail.com' 
      sexo = 'masculino'

      # Execution
      CreateUserCommand.new(name:nome, birthdate:dataNascimento, email:email, gender:sexo, street:rua, number:numero, city:cidade, country:pais)
      
      # Expectations
      expect(User.last.address_id).to eq(Address.last.id)
      expect(Address.last.city).to include('paulo')
      expect(Address.last.number).to eq(numero)

    end
  end
end