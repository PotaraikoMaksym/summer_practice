require_relative "Validation"

class Person
  include Validation

  attr_accessor :first_name, :last_name, :id, :birth_date

  def initialize(first_name, last_name, id, birth_date)
    @first_name = first_name
    @last_name = last_name
    @id = id
    @birth_date = birth_date
  end

  def valid?

    valid_first_name = Validation.valid_name?(@first_name)
    valid_last_name = Validation.valid_name?(@last_name)
    valid_id = Validation.valid_id?(@id)
    valid_birthdate = Validation.valid_date?(@birth_date)

    valid_first_name && valid_last_name && valid_id && valid_birthdate
  end
end