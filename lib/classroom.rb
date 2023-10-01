class Classroom
  attr_accessor :label, :students, :classroom

  def initialize(label)
    @label = label
    @classroom = []
  end

  def add_student(student)
    @classroom << student
    student.classroom = self
  end
end
