# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!([
  { name: 'Ben', password: '123456', password_confirmation: '123456', zoo_id: 1, email: 'ben@ben.com' },
  { name: 'Alice', password: '654321', password_confirmation: '654321', zoo_id: 2, email: 'alice@alice.com' }
])

Zoo.create!([
  { name: 'Best Zoo Ever', animal_capacity: 5, keeper_capacity: 50, user_id: 1 },

  { name: 'Second Best Zoo Ever', animal_capacity: 2, keeper_capacity: 2, user_id: 2 }
])

Animal.create!([
  { name: 'Shasta', species: 'Cheetah', personality: 'Playful', zoo_id: 1 },

  { name: 'Rocky', species: 'Rhino', personality: 'Quiet', zoo_id: 2 },

  { name: 'Cathryn', species: 'Lemur', personality: 'Mischevious', zoo_id: 1 }
])

Keeper.create!([
    { name: 'Katie', zoo_id: 1 },

    { name: 'Bob', zoo_id: 2 },

    { name: 'Hans', zoo_id: 2 }
])
