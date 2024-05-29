class Admin
  attr_accessor :username, :password

  def initialize(username, password)
    @username = username
    @password = password
  end

  def authenticate(username, password)
    @username == username && @password == password
  end
end