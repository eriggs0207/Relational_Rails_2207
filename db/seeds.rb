# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
team_1 = Team.create!(name: "Mets", city: "New York",
  playoffs: true, wins: 79, losses: 45)
team_2 = Team.create!(name: "Braves", city: "Atlanta",
  playoffs: true, wins: 76, losses: 48)
team_3 = Team.create!(name: "Phillies", city: "Philadelphia",
  playoffs: true, wins: 69, losses: 55)
team_4 = Team.create!(name: "Marlins", city: "Miami",
  playoffs: false, wins: 54, losses: 70)
player_1 = team_1.players.create!(name: "Pete Alonso", position: "First Base",
    free_agent: false, salary: 7400000)
player_2 = team_1.players.create!(name: "Jacob deGrom", position: "Pitcher",
    free_agent: true, salary: 33000000)
player_3 = team_2.players.create!(name: "Ronald Acuna Jr", position: "Center Field",
    free_agent: false, salary: 12500000)
player_4 = team_2.players.create!(name: "Austin Riley", position: "Third Base",
    free_agent: true, salary: 3950000)
player_5 = team_3.players.create!(name: "Bryce Harper", position: "Right Field",
    free_agent: false, salary: 17625000)
player_6 = team_4.players.create!(name: "Sandy Alcantara", position: "Pitcher",
    free_agent: false, salary: 10000000)
