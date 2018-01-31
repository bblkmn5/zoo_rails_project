# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create({username: "Ben", password: "12345", email: "ben@ben.com"}, {username: "Alice", password: "54321", email: "alice@alice.com"})

Animal.create({name: "Shasta", species: "Cheetah", gender: "female", personality: "playful", hungry: true, clean: true}, {name: "Rocky", species: "Rhino", gender: "male", personality: "quiet", hungry: false, clean: false})

Keeper.create({name: "Katie", experience: 2}, {name: "Bob", experience: 15})

