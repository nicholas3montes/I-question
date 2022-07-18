class CreateUserCommand

  def initialize(name:, birthdate:, email:, gender:, street:, number:, city:, country:)
    Address.new(street: street, number: number, city: city, country: country).save
    User.new(name: name, birthdate: birthdate, email: email, gender: gender, address_id: Address.last.id).save
  end
end