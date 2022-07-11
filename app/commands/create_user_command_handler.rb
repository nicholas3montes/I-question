class CreateUserCommandHandler
  def execute(nome, dataNascimento, email, sexo, street, number, city, country)
    address = Address.new(street: street, number: number, city: city, country: country).save
    User.new(name: nome, birthdate: dataNascimento, email: email, gender: sexo, address_id: Address.last.id).save
    User.last
  end
end