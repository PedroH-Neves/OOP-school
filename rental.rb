require './book'
require './person'

class Rental
  attr_accessor :date, :book, :person

  def intializate(date, book, person)
    @date = date
    @book = book
    book.rentals << self
    @person = person
    person.rentals << self
  end

end