class CreateUserCommand

  def execute(name:, birthdate:, email:, gender:, street:, number:, city:, country:)
    CreateUserCommandHandler.new(name: name, birthdate: birthdate, email: email, gender: gender,
       street: street, number: number, city: city, country: country).execute
  end
end