require './person'

class Studentes < Person
  def intializate(name = "Unknown", age, parent_permission: true, classroom)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end