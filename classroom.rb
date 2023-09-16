class Classroom
  attr_accessor :label

  def intializate(label)
    @label = label
    @classroom = []
  end

  def add_student(student)
    @classroom.push(student)
    student.classroom = self
  end
end
