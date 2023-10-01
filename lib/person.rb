require_relative 'nameable'
require_relative 'rental'

class Person < Nameable
  attr_accessor :name, :age, :parent_permission, :rentals
  attr_reader :id, :classroom

  def initialize(age, name = 'unknow', parent_permission: true)
    super()
    @id = rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def add_rental(book, date)
    @rentals << Rental.new(date, book, self)
  end

  def correct_name
    @name
  end

  def of_age?
    @age >= 18
  end

  private

  def can_use_services?
    of_age? || @parent_permission
  end
end
