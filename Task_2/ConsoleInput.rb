require_relative "Validation"
require_relative "Person"

include Validation

puts "Input your first name"
first_name = Validation.validation_name()

puts "Input your last name"
last_name = Validation.validation_name()

puts "Input your id"
id = Validation.validation_id()

puts "Input your birthdate"
birthdate = Validation.validation_birthdate()

person1 = Person.new(first_name,last_name, id, birthdate)

puts "Person 1 Validation: #{person1.valid?}"