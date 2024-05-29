class BookingSystem
  attr_accessor :movies, :users, :admin

  def initialize(admin_username, admin_password)
    @movies = []
    @users = []
    @admin = Admin.new(admin_username, admin_password)
  end

  def add_movie(movie)
    @movies << movie
  end

  def find_movie(title)
    @movies.find { |movie| movie.title == title }
  end

  def find_user(name)
    @users.find { |user| user.name == name }
  end

  def create_user(name)
    user = User.new(name)
    @users << user
    user
  end

  def book_ticket(movie_title, show_time, user_name)
    movie = find_movie(movie_title)
    return nil unless movie

    show = movie.shows.find { |s| s.time == show_time }
    return nil unless show

    seat_number = show.book_seat(user_name)
    return nil unless seat_number

    user = find_user(user_name) || create_user(user_name)
    booking = { movie_title: movie_title, show_time: show_time, seat_number: seat_number }
    user.add_booking(booking)
    booking
  end

  def cancel_ticket(movie_title, show_time, seat_number)
    movie = find_movie(movie_title)
    return false unless movie

    show = movie.shows.find { |s| s.time == show_time }
    return false unless show

    show.cancel_seat(seat_number)
  end

  def show_status(movie_title, show_time)
    movie = find_movie(movie_title)
    return nil unless movie

    show = movie.shows.find { |s| s.time == show_time }
    return nil unless show

    show.status
  end
end
