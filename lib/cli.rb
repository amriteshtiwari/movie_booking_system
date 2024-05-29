class CLI
  def initialize(booking_system)
    @booking_system = booking_system
    @current_user = nil
  end

  def run
    puts "Welcome to the Movie Booking System!"
    login
    main_menu
  end

  private

  def login
    loop do
      puts "Login as:"
      puts "1. Admin"
      puts "2. User"
      print "Choose an option: "
      choice = gets.chomp.to_i

      case choice
      when 1
        admin_login
        break if @current_user
      when 2
        user_login
        break if @current_user
      else
        puts "Invalid option. Please try again."
      end
    end
  end

  def admin_login
    print "Enter admin username: "
    username = gets.chomp
    print "Enter admin password: "
    password = gets.chomp

    if @booking_system.admin.authenticate(username, password)
      @current_user = @booking_system.admin
      puts "Admin login successful!"
    else
      puts "Invalid admin credentials!"
    end
  end

  def user_login
    print "Enter your name: "
    name = gets.chomp
    @current_user = @booking_system.find_user(name) || @booking_system.create_user(name)
    puts "User login successful!"
  end

  def main_menu
    loop do
      if @current_user.is_a?(Admin)
        admin_menu
      else
        user_menu
      end
    end
  end

  def admin_menu
    puts "Admin Panel:"
    puts "1. Add Movie"
    puts "2. Add Show"
    puts "3. Show Status"
    puts "4. Logout"
    print "Choose an option: "
    choice = gets.chomp.to_i

    case choice
    when 1
      add_movie
    when 2
      add_show
    when 3
      show_status
    when 4
      logout
    else
      puts "Invalid option. Please try again."
    end
  end

  def user_menu
    puts "User Panel:"
    puts "1. Book Ticket"
    puts "2. Cancel Ticket"
    puts "3. View My Bookings"
    puts "4. Logout"
    print "Choose an option: "
    choice = gets.chomp.to_i

    case choice
    when 1
      book_ticket
    when 2
      cancel_ticket
    when 3
      view_bookings
    when 4
      logout
    else
      puts "Invalid option. Please try again."
    end
  end

  def add_movie
    print "Enter movie title: "
    title = gets.chomp
    print "Enter movie genre: "
    genre = gets.chomp
    movie = Movie.new(title, genre)
    @booking_system.add_movie(movie)
    puts "Movie added successfully!"
  end

  def add_show
    print "Enter movie title: "
    title = gets.chomp
    movie = @booking_system.find_movie(title)
    unless movie
      puts "Movie not found!"
      return
    end

    print "Enter show time (e.g., 18:00): "
    time = gets.chomp
    print "Enter total seats: "
    total_seats = gets.chomp.to_i
    show = Show.new(time, total_seats)
    movie.add_show(show)
    puts "Show added successfully!"
  end

  def book_ticket
    print "Enter movie title: "
    title = gets.chomp
    print "Enter show time: "
    time = gets.chomp
    print "Enter your name: "
    user_name = @current_user.name
    booking = @booking_system.book_ticket(title, time, user_name)
    if booking && booking[:seat_number]
      puts "Booking confirmed! Movie: #{booking[:movie_title]}, Show Time: #{booking[:show_time]}, Seat Number: #{booking[:seat_number]}"
    else
      puts "Booking failed! Either movie or show not found, or no available seats."
    end
  end

  def cancel_ticket
    print "Enter movie title: "
    title = gets.chomp
    print "Enter show time: "
    time = gets.chomp
    print "Enter seat number to cancel: "
    seat_number = gets.chomp.to_i
    success = @booking_system.cancel_ticket(title, time, seat_number)
    if success
      puts "Ticket canceled successfully!"
    else
      puts "Cancellation failed! Either movie or show not found, or seat number is invalid."
    end
  end

  def show_status
    print "Enter movie title: "
    title = gets.chomp
    print "Enter show time: "
    time = gets.chomp
    status = @booking_system.show_status(title, time)
    if status
      puts "Show Status: Total Seats: #{status[:total_seats]}, Available Seats: #{status[:available_seats]}, Booked Seats: #{status[:booked_seats]}"
    else
      puts "Status check failed! Either movie or show not found."
    end
  end

  def view_bookings
    bookings = @current_user.bookings
    if bookings.empty?
      puts "No bookings found."
    else
      puts "Your Bookings:"
      bookings.each do |booking|
        puts "Movie: #{booking[:movie_title]}, Show Time: #{booking[:show_time]}, Seat Number: #{booking[:seat_number]}"
      end
    end
  end

  def logout
    @current_user = nil
    puts "Logged out successfully!"
    login
  end
end
