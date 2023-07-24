require 'test/unit'
require 'date'
require_relative '../Person'
class PersonTest < Test::Unit::TestCase

    def setup
      date = Date.parse("2003-01-01")
      @person = Person.new('Anna', 'Anna', 'AZ1234567890', date)
    end

    ['Name', 'Name-Ex', 'NameIng'].each do |name|
      define_method("test_valid_name_ = \"#{name}\"") do
        @person.first_name = name
        assert_equal(name, @person.first_name, "Name #{name} is valid")
      end
    end

    [' ', '', '-', '12343', 'Nweq23', 'Awewq0-'].each do |name|
      define_method("test_invalid_name_ = \"#{name}\"") do
        assert_raise { @person.valid?.first_name = name }
      end
    end

    ['id32476598762', 'id324765987', 'VDs545432347', 'BF767569ds8'].each do |id|
      define_method("test_valid_id_ = \"#{id}\"") do
        @person.id = id
        assert_equal(id, @person.id, "id #{id} is valid")
      end
    end

    [' ', '', '-', 'afwadawdaw', '12325345', 'SDfSEFE'].each do |id|
      define_method("test_invalid_id_ = \"#{id}\"") do
        assert_raise { @person.valid?.id = id }
      end
    end

    ['2000-02-02', '1990-01-09', '1900-09-09'].each do |birth_date|
      define_method("test_valid_birth_date_ = \"#{birth_date}\"") do
        @person.birth_date = birth_date
        assert_equal(birth_date, @person.birth_date, "Birth date #{birth_date} is valid")
      end
    end

    [' ', '', '-', '2026-09-09', '2060-09-09', 2040-11-01].each do |birth_date|
      define_method("test_invalid_birth_date_ = \"#{birth_date}\"") do
        assert_raise { @person.valid?birth_date = birth_date }
      end
    end

end