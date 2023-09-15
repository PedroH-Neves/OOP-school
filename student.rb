require './person.rb'

class studentes < person
  
  def intializate(name = "Unknown", age, parent_permission = true, classroom)
    @classroom = classroom