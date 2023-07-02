require_relative "Validation"
require_relative "PersonRepository"

include Validation
include PersonRepository


puts "Person 1 Validation: #{person1.valid?}"
puts "Person 2 Validation: #{person2.valid?}"