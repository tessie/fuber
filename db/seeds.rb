# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#  movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cab.create([{ registration_number: 'KL452134', status: 'available', lat: 9.997090, long: 76.302815 },
            { registration_number: 'KL452344', status: 'booked', lat: 9.997090, long: 76.302815 },
            { registration_number: 'KL451334', status: 'available', lat: 9.998480, long: 9.998480 },
            { registration_number: 'KL452304', status: 'available', lat: 10.057906, long: 76.346362 }])

Customer.create([{ name: 'customer1', lat: 9.970433, long: 76.299137 },
                 { name: 'customer2', lat: 10.107570, long: 76.345662 }])
