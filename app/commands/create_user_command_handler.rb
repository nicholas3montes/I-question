class CreateUserCommandHandler
  def execute(name:, birthdate:, email:, gender:, street:, number:, city:, country:)
    CreateUserCommand.new(name: name, birthdate: birthdate, email: email, gender: gender,
       street: street, number: number, city: city, country: country)
    User.last
  end
end