require_relative 'lib/movie'
require_relative 'lib/show'
require_relative 'lib/booking_system'
require_relative 'lib/user'
require_relative 'lib/admin'
require_relative 'lib/cli'

# Default admin credentials
admin_username = "admin"
admin_password = "password"

booking_system = BookingSystem.new(admin_username, admin_password)
cli = CLI.new(booking_system)
cli.run
