# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create([
  {name: "John Doe", email: "johndoe.23@gmail.com"}, 
  {name: "Akai", email: "akaiisred@gmail.com"}, 
  {name: "Conan", email: "iamconan@yahoo.com"}, 
  {name: "Ran", email: "ran.outofnames@hotmail.com"}
])