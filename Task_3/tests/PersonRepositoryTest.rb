require "test/unit"
require_relative "../Person"
require_relative "../PersonRepository"

class PersonRepositoryTest < Test::Unit::TestCase
  def setup
    @peopleTestRep = PersonRepository.new
    @person1 = Person.new("Name", "Surname", "id1212312", "2000-01-01")
    @person2 = Person.new("Beyr", "Wen", "id876788787", "1990-01-01")
  end

  def test_add
    @peopleTestRep.add(@person1)
    @peopleTestRep.add(@person2)
    assert_equal(2, @peopleTestRep.people.length)
    assert_includes(@peopleTestRep.people, @person1)
    assert_includes(@peopleTestRep.people, @person2)
  end

  def test_add_invalid
    invalid_person = Person.new("123123", "AB0123456789", "2003-01-18")
    @peopleTestRep.add(invalid_person)
  end

  def test_delete_by_id
    @peopleTestRep.add(@person1)
    @peopleTestRep.add(@person2)
    @peopleTestRep.delete_by_id("id876788787")
    assert_equal(1, @peopleTestRep.people.length)
    assert_not_includes(@peopleTestRep.people, @person2)
  end

  def test_get
    @peopleTestRep.add(@person1)
    @peopleTestRep.add(@person2)
    all_people = @peopleTestRep.get
    assert_equal(2, all_people.length)
    assert_includes(all_people, @person1)
    assert_includes(all_people, @person2)
  end

  def test_get_by_id
    @peopleTestRep.add(@person1)
    person = @peopleTestRep.get_by_id("id1212312")
    assert_equal(@person1, person)
  end

  def test_get_by_id_none
    person = @peopleTestRep.get_by_id("-0-90")
    assert_nil(person)
  end
end