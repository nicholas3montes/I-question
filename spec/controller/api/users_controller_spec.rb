require 'rails_helper'

describe 'UsersController', type: :request do
  context 'create' do
    it 'create and save user' do
      # Setup      
      user = {name: 'nicholas', birthdate: 22/03/1998, email:'nicholasmontes0@gmail.com', gender:'masculino'}
      binding.pry
      # Execution
      post api_users_path, params: user

      # Expectations
      expect(response).to have_http_status(201)
      expect(User.last.gender).to eq('masculino')

    end
  end
end