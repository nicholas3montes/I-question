class CreateUserCommandHandler
  def execute(nome, dataNascimento, email, sexo)
    User.new(name: nome, birthdate: dataNascimento, email: email, gender: sexo).save
    User.last
  end
end