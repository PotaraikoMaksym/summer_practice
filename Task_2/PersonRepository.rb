require_relative "Person"

class PersonRepository

  def initialize
    @persons = {
      AZ1234567890: {
        first_name: "John",
        last_name: "Doe",
        birth_date: "1990-01-01"
      },
      AZ1234567809: {
        first_name: "John",
        last_name: "Doe",
        birth_date: "2003-02-30"
      }
    }
  end

  def add?(person)
    @persons[person.id] = {
      first_name: person.first_name,
      last_name: person.last_name,
      birthday: person.birth_date
    }
  end

  def edit?(person)
    @persons[person.id] = {
      first_name: person.first_name,
      last_name: person.last_name,
      birthday: person.birth_date
    }
  end

  def delete(person)
    @persons.delete(person.id)
    return person
  end

  def byId(id)
    return @persons[id]
  end

  def byFirstOrLastName(text)

    result = []

    @persons.each do |person|
      if person[:first_name] == text || person[:last_name]
        result << person
      end
    end

    return result
  end

  def getAll
    return @persons
  end

  def byDateRange(from, to)
    if start_date.nil?
      start_date = Date.new(1900, 1, 1)
    else
      start_date = Date.parse(start_date)
    end

    if end_date.nil?
      end_date = Date.today - 1
    else
      end_date = Date.parse(end_date)
    end

    @persons.each do |person|
      birthday = Date.parse(person[:birthday])
      return (start_date..end_date).cover?(birthday)
    end
  end

end