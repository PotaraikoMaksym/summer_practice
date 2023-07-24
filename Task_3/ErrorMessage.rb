module ErrorMessage
  def birthdayNotToday
    return puts "You birth not today"
  end

  def notCorrectFormat
    puts "Not correct format. Must be 2000-01-20"
  end

  def nameNotCorrect
     puts "Your name in not correct"
  end

  def idNotCorrect
    puts "Your id in not correct"
  end

  def alreadyInDatabase
    puts "This person already in database"
  end

  def notInDatabase
    puts "This person is not in the database"
  end

  def notFound
    puts "Nothing was found for your details"
  end

end