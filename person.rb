require './nameable'

class Person < Nameable
  def initialize(age, name: 'unknown', parent_permission: true)
    super()
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def add_rental(book, date)
    Rental.new(date, book, self)
  end

  attr_accessor :name, :age, :parent_permission, :rentals
  attr_reader :id, :classroom

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end

  public

  def can_use_services?
    of_age? || @parent_permission
  end
end
