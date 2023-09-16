require './person'

class Studentes < Person
  def intializate(classroom, age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
