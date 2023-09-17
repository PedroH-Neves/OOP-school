require_relative 'book'
require_relative 'person'
require_relative 'teacher'
require_relative 'classroom'
require_relative 'nameable'
require_relative 'student'

class App
  def initialize
    @books = []
    @peoples = []
    @rentals = []
    @students = []
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
  end

  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase == 'y'
    print 'Classroom: '
    classroom = gets.chomp
    Student.new(age, classroom, name, parent_permission)
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    Teacher.new(age, specialization, name)
  end

  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    person_type = gets.chomp.to_i

    if person_type == 1
      @peoples << create_student
      puts 'Student created successfully'
    elsif person_type == 2
      @peoples << create_teacher
      puts 'Teacher created successfully'
    else
      puts 'Invalid option'
    end
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @books << Book.new(title, author)
    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number'
    list_books
    book_index = gets.chomp.to_i
    puts 'Select a person from the following list by number (not id)'
    list_people
    person_index = gets.chomp.to_i
    puts 'Date: '
    date = gets.chomp
    @rentals << Rental.new(date, @books[book_index], @people[person_index])
    puts 'Rental created successfully'
  end

  def list_rentals_for_person(people)
    puts "Enter the person's ID:"
    person_id = gets.chomp.to_i
    person = people.find { |p| p.id == person_id }
    unless person
      puts 'Person not found.'
      return
    end

    puts "Rentals for #{person.name}:"
    person.rentals.each do |rental|
      puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
    end
  end
end
