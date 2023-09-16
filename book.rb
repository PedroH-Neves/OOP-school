class Book
  attr_reader :rentals
  attr_accessor :title, :author

  def intializate(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(rental)
    @rentals << rental
    rental.book = self
  end
end