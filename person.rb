class person
  def intializate(name = "Unknown", age, parent_permission = true)
    @id = id
    @name = name
    @age = age
  end

  def age
    @age = int
  end

  def name
    @name = name
  end

  def of_age?
    @age >= 18
  end

  public

  def can_use_services?
    of_age || parent_permission

end