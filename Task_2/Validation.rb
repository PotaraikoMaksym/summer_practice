require 'date'
require_relative "ErrorMessage"

include ErrorMessage
module Validation
  VALID_NAME_LENGTH = 40

  def self.valid_name?(name)
    return false if name.nil? || name.length > VALID_NAME_LENGTH

    name.match?(/\A[A-Za-z\s]+\z/)
  end

  def self.valid_id?(id)
    return false if id.nil?

    id.match?(/^[A-Z]{2}\d{10}$/)
  end

  def self.valid_date?(date)
    return false if date.nil?

    pattern = /\A\d{4}-\d{2}-\d{2}\z/


    date_obj = Date.parse(date)

    if date_obj < Date.today
      else
        ErrorMessage.birthdayNotToday
      return false
    end

    unless date.match?(pattern)
      ErrorMessage.notCorrectFormat
      return false
    end

    return true

  end

  def validation_name()
    name = gets.chomp
    while true do
      valid = Validation.valid_name?(name)
      if valid
        return name
      else
        ErrorMessage.nameNotCorrect
        name = gets.chomp
      end
    end
  end


  def validation_id()
    id = gets.chomp
    while true do
      valid = Validation.valid_id?(id)
      if valid
        return id
      else
        ErrorMessage.idNotCorrect
        id = gets.chomp
      end
    end
  end

  def validation_birthdate()
    birthdate = gets.chomp
    while true do
      valid = Validation.valid_date?(birthdate)
      if valid
        return birthdate
      else
        birthdate = gets.chomp
      end
    end
  end


end