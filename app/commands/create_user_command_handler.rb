class CreateUserCommandHandler
  
  attr_accessor :name, :birthdate, :email, :gender, :street, :number, :city, :country
  
  def initialize(name:, birthdate:, email:, gender:, street:, number:, city:, country:)
    
    @name = name
    @birthdate = birthdate
    @email = email
    @gender = gender
    @street = street
    @number = number
    @city = city
    @country = country
  end

  def execute

    Address.new(street: @street, number: @number, city: @city, country: @country).save
    User.new(name: @name, birthdate: @birthdate, email: @email, gender: @gender, address_id: Address.last.id).save
    User.last
  end
end