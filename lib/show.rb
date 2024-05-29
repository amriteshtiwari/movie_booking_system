class Show
  attr_accessor :time, :total_seats, :available_seats, :booked_seats

  def initialize(time, total_seats)
    @time = time
    @total_seats = total_seats
    @available_seats = (1..total_seats).to_a
    @booked_seats = {}
  end

  def book_seat(user_name)
    return nil if @available_seats.empty?

    seat_number = @available_seats.shift
    @booked_seats[seat_number] = user_name
    seat_number
  end

  def cancel_seat(seat_number)
    if @booked_seats.key?(seat_number)
      user_name = @booked_seats.delete(seat_number)
      @available_seats.push(seat_number).sort!
      true
    else
      false
    end
  end

  def status
    {
      total_seats: @total_seats,
      available_seats: @available_seats,
      booked_seats: @booked_seats
    }
  end
end
