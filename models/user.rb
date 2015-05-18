class User

  def initialize(firstname, lastname)
    @firstname = firstname
    @lastname = lastname
  end

  def name
    "#{@firstname} #{@lastname}"
  end

end