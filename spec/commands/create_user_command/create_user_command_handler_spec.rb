require 'rails_helper'

describe 'CreateUserCommandHandler', type: :request do
  context 'Usuario esta sendo criado' do
    it 'O usuario deve existir com todas informações passadas' do
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
      CreateUserCommandHandler.new(name:nome, birthdate:dataNascimento, email:email, 
        gender:sexo, street:rua, number:numero, city:cidade, country:pais).execute
        
    
      # Expectations
      expect(User.last.gender).to eq(sexo)
      expect(User.last.email).to include('@gmail')
      expect(User.last.address_id).to eq(Address.last.id)
      expect(Address.last.number).to eq(numero)
      expect(Address.last.city).to include('paulo')
    end
  end
end