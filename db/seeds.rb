# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


categoriesSeed = [
  {name: "fck yeah"},
  {name: "too sexy for my shirt"},
  {name: "don't kill my vibe"},
  {name: "nopenopenopenopenope"},
  {name: "forever alone"},
  {name: "handsome sloth"}
]

Category.destroy_all
Category.create(categoriesSeed)
