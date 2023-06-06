# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all
Flat.destroy_all

user1 = User.create(email:"user1@gmail.com", password:"azerty")

flat1 = Flat.create(address: "Place de l'église", city: "Lyon", number_of_guests: "2", price_per_night: "56", description: "Très jolie", user_id:user1.id)
flat2 = Flat.create(address: "Rue la gare", city: "Marseille", number_of_guests: "4", price_per_night: "75", description: "Cosy", user_id:user1.id)
