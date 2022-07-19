# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# db/seeds.rb
john =
  User.create!(
    email: "john.doe@example.com",
    first_name: "John",
    last_name: "Doe",
    password: SecureRandom.hex
  )

jane =
  User.create!(
    email: "jane.doe@example.com",
    first_name: "Jane",
    last_name: "Doe",
    password: SecureRandom.hex
  )

location =
  Location.create!(
    name: "Leon, Nicaragua",
    latitude: 12.43787,
    longitude: -86.87804
  )

Job.create!(
  [
    {
      title: "Martian Chronicles",
      content: "Cult book by Ray Bradbury",
      author: john,
      location: location
    },
    {
      title: "The Martian",
      content:
        "Novel by Andy Weir about an astronaut stranded on Mars trying to survive",
      author: john,
      location: location
    },
    {
      title: "Doom",
      content:
        "A group of Marines is sent to the red planet via an ancient " \
          "Martian portal called the Ark to deal with an outbreak of a mutagenic virus",
      author: jane,
      location: location
    },
    {
      title: "Mars Attacks!",
      content:
        "Earth is invaded by Martians with unbeatable weapons and a cruel sense of humor",
      author: jane,
      location: location
    }
  ]
)
