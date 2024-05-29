# Movie Booking System

## Overview

This is a simple Ruby CLI-based application for managing movie bookings. Users can add movies, add show timings, book tickets, cancel tickets, and check the status of show bookings. The application supports two types of users: Admin and regular Users.

## Features

- **Movie Initialization**: Define a list of available movies with details such as title and genre.
- **User Booking**: Book tickets for a specific movie and showtime, keeping track of the number of available seats.
- **Seat Allocation**: Allocate the next available seat when a user books a ticket.
- **Ticket Cancellation**: Cancel booked tickets and make the seats available for booking again.
- **Booking Confirmation and Display**: Provide booking confirmation with details and display the current status of booked and available seats.
- **Multiple Movies and Shows**: Support multiple movies with different show timings.
- **User Roles**: Admin with a default login and Users automatically created during ticket booking.

## Approach

### Data Structure

The movie booking system primarily utilizes arrays and hashes to represent and manage data efficiently.

1. **Arrays**: Arrays are used to represent lists of items, such as the list of available seats in a show or the list of shows associated with a movie. For example, in the `Show` class, we use an array to store the available seats and another array to represent the booked seats.

2. **Hashes**: Hashes are used to associate data with keys for efficient retrieval. We use hashes to store information such as booked seats, where the seat number is the key and the user's name is the value. This allows us to quickly determine the booking status of a particular seat.

These data structures are chosen for their simplicity, efficiency, and flexibility in representing the required information and facilitating the operations required by the movie booking system.

## Directory Structure

```
movie_booking_system/
├── lib/
│   ├── movie.rb
│   ├── show.rb
│   ├── booking_system.rb
│   ├── user.rb
│   ├── admin.rb
│   └── cli.rb
├── README.md
└── main.rb
```
- **lib/movie.rb**: Defines the `Movie` class, which holds the title, genre, and associated shows of a movie.
- **lib/show.rb**: Defines the `Show` class, which manages show timings and seat bookings.
- **lib/booking_system.rb**: Defines the `BookingSystem` class, which manages the overall booking process and maintains users and movies.
- **lib/user.rb**: Defines the `User` class, which represents a regular user with a name and bookings.
- **lib/admin.rb**: Defines the `Admin` class, which represents an admin with authentication capabilities.
- **lib/cli.rb**: Defines the `CLI` class, which handles user interaction via the command line interface.
- **main.rb**: Entry point of the application, initializing the booking system and starting the CLI.

## How to Run

1. **Clone the repository:**
   ```bash
   git clone https://github.com/yourusername/movie_booking_system.git
   cd movie_booking_system
   ```

2. **Run the application:**
   ```bash
   ruby main.rb
   ```

3. **Follow the on-screen instructions to interact with the application.**

## Example Usage

### Admin Login

```
Choose an option: 1
Enter admin username: admin
Enter admin password: password
Admin login successful!
```

### Add a Movie

```
Choose an option: 1
Enter movie title: Inception
Enter movie genre: Sci-Fi
Movie added successfully!
```

### Add a Show

```
Choose an option: 2
Enter movie title: Inception
Enter show time (e.g., 18:00): 18:00
Enter total seats: 100
Show added successfully!
```

### User Login

```
Choose an option: 2
Enter your name: John Doe
User login successful!
```

### Book a Ticket

```
Choose an option: 1
Enter movie title: Inception
Enter show time: 18:00
Booking confirmed! Movie: Inception, Show Time: 18:00, Seat Number: 1
```

### Cancel a Ticket

```
Choose an option: 2
Enter movie title: Inception
Enter show time: 18:00
Enter seat number to cancel: 1
Ticket canceled successfully!
```

### Show Status

```
Choose an option: 3
Enter movie title: Inception
Enter show time: 18:00
Show Status: Total Seats: 100, Available Seats: [1, 2, 3, ...], Booked Seats: {}
```
