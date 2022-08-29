require 'rails_helper'

RSpec.describe Player, type: :model do
  it {should belong_to :team}
  # describe 'instance methods' do
  #   before :each do
  #     @team_1 = Team.create!(name: "Mets", city: "New York",
  #         playoffs: true, wins: 79, losses: 45)
  #     @team_2 = Team.create!(name: "Braves", city: "Atlanta",
  #         playoffs: true, wins: 76, losses: 48)
  #     @player_1 = @team_1.players.create!(name: "Pete Alonso", position: "First Base",
  #         free_agent: false, salary: 7400000)
  #     @player_2 = @team_1.players.create!(name: "Jacob deGrom", position: "Pitcher",
  #         free_agent: true, salary: 33000000)
  #     @player_3 = @team_2.players.create!(name: "Ronald Acuna Jr", position: "Center Field",
  #         free_agent: false, salary: 12500000)
  #     @player_4 = @team_2.players.create!(name: "Austin Riley", position: "Third Base",
  #         free_agent: true, salary: 3950000)
  #       end
  #
  #   describe '#current_free_agents' do
  #     it 'returns players that are free agents next season' do
  #       expect(@player_1.current_free_agents).to eq(false)
  #       expect(@player_2.current_free_agents).to eq(true)
  #       expect(@player_4.current_free_agents).to eq(true)
  #     end
  #   end
  # end
end
