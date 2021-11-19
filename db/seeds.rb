require 'faker'
require "open-uri"
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

user_me = User.create!(email: "user@user.com", password: "password")
user = User.create!(email: "user2@user.com", password: "password")
user2 = User.create!(email: "user3@user.com", password: "password")
user3 = User.create!(email: "user4@user.com", password: "password")
users = [user, user2, user3]

adrress = ["Carrer Muntaner, Barcelona", "Carrer d'Aragó, Barcelona", "Carrer Villarroel, Barcelona", "Gran Via de les Corts Catalanes, Barcelona", "Oude Raadhuislaan, 3054NS, Rotterdam", "Kempenlaan, 1066RA, Amsterdam, Netherlands", "Jansbuitensingel 165, 6811AC, Arnhem", "Peter van Anrooystraat 46, 1076DA, Amsterdam", "Van Koetsveldstraat 25, 3532 ES, Utrecht", "Koningslaan 200, 3067TG, Rotterdam", "Capitaine Jean Luc PICARD, 33500, Libourne, France", "MCPO Jean Sienne, 02552, LIBOURNE, FRANCE", "Groenplaats 21, 2000 Antwerpen, Belgium", "Bd Sylvain Dupuis 433, 1070 Brussels, Belgium", "Albrecht-Dürer-Straße 39, 90403 Nürnberg, Germany", "Schloß Nymphenburg 1, 80638 München, Germany"]
names = ["DYNAMAX", "ENTER COACH", "FLEETWOOD RV", "FOREST RIVER RV", "GULF STREAM COACH", "HAYCO", "LAZY DAZE", "NEXUS RV", "RENEGADE RV", "NEYMAR", "PHOENIX", "THOR MOTOR",]
descriptions = ["Omni", "Cruiser", "Supreme Aire", "Renegade", "Triumph SC", "Lazy Daze 24", "Seneca", "Bt Criuser", "Forester", "Pulse and Jamboree", "Odyssey", "Sunseeker"]
images = ["https://images.unsplash.com/photo-1513311068348-19c8fbdc0bb6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80","https://images.unsplash.com/photo-1627664819818-e147d6221422?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2888&q=80", "https://images.unsplash.com/photo-1527786356703-4b100091cd2c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1548&q=80", "https://images.unsplash.com/photo-1597257095947-c15b23285ed1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2940&q=80", "https://images.unsplash.com/photo-1543395136-75b39bc00e0e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1740&q=80", "https://images.unsplash.com/photo-1594495894542-a46cc73e081a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1742&q=80", "https://images.unsplash.com/photo-1634756123324-fb0b38fcda56?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80", "https://images.unsplash.com/photo-1598524898412-d66b744c7f03?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80", "https://images.unsplash.com/photo-1586314208708-732532bae133?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1748&q=80", "https://images.unsplash.com/photo-1586153990182-f7cfdc66da19?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1740&q=80", "https://images.unsplash.com/photo-1591189863281-b67262acb638?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1740&q=80", "https://images.unsplash.com/photo-1565285150804-43ddd99f6e65?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2940&q=80"]

names.each_with_index do |name, index|
  camper = Camper.new(
    name: name,
    description: descriptions[index],
    address: adrress[index],
    price: rand(50..300),
    user: users.sample
  )
  camper.save!

  file = URI.open(images[index])
  camper.image.attach(io: file, filename: 'camper.png', content_type: 'image/png')

  puts "Done!"
end
