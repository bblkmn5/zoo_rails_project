# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create([{username: "Ben", password: "12345", zoo_id: 1, email: "ben@ben.com"}, {username: "Alice", password: "54321", zoo_id: 2, email: "alice@alice.com"}])

Animal.create([{name: "Shasta", species: "Cheetah", personality: "playful", keepers_needed: 1, zoo_id: 1, last_fed: nil, last_cleaned: nil}, {name: "Rocky", species: "Rhino", personality: "quiet", keepers_needed: 2, zoo_id: 2, last_fed: nil, last_cleaned: nil}])

Keeper.create([{name: "Katie", zoo_id: 1}, {name: "Bob", zoo_id: 2}, {name: "Hans", zoo_id: 2}])

Zoo.create([{name: "Best Zoo Ever", animal_capacity: "5", keeper_capacity: 5, user_id: 1}, {name: "Second Best Zoo Ever", animal_capacity: "2", keeper_capacity: 2, user_id: 2}])


