require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



Booking.destroy_all

Camper.destroy_all

User.destroy_all

user = User.create!(email: "user@user.com", password: "password")
adrress = ["Carrer Muntaner, Barcelona", "Carrer d'Aragó, Barcelona", "Carrer Villarroel, Barcelona", "Gran Via de les Corts Catalanes, Barcelona"]

20.times do
  Camper.create!(
    name: Faker::Vehicle.manufacture,
    description: Faker::Vehicle.model,
    address: adrress.sample,
    price: rand(50..300),
    review: Faker::Vehicle.standard_specs,
    user: User.find_by(email: "user@user.com")
  )
end
puts "Done!"
