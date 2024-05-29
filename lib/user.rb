class User
	attr_accessor :name, :bookings

	def initialize(name)
		@name = name
		@bookings = []
	end

	def add_booking(booking)
		@bookings << booking
	end
end