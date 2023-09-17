require_relative 'book'
require_relative 'person'

class App
  def initialize
    @books
    @peoples
    @rentals
  end

  def list_of_books
    @books.each do |book|
      puts("Book: #{book.title} by #{book.author}")
    end
  end

  def list_of_people
    @peoples.each do |person|
      if person.is_a?(Student)
        puts "[Student] ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
      elsif person.is_a?(Teacher)
        puts "[Teacher] ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
    end
  end

  def create_person(name, type)
    if type == 'teacher'
      Teacher.new(name)
    elsif type == 'student'
      Student.new(name)
    else
      puts 'Invalid person type.'
    end
  end
  
  def create_book(title, author)
    Book.new(title, author)
  end
  
  def create_rental(book, person, date)
    Rental.new(book, person, date)
  end
end