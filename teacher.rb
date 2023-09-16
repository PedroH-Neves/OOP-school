require './person'

class Teacher < Person
  def intializate(specialization, age, name = 'Unknown', parent_permission: true)
    uper(age, name, parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
