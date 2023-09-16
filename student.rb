require './person'

class Studentes < Person
  def intializate(classroom, age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def classroom_assign(classroom_assign)
    @classroom = classroom_assign
    classroom_assign.student.push(self) unless classroom_assign.student.include?(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
