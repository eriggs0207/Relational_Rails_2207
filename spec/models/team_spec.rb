require 'rails_helper'

RSpec.describe Team, type: :model do
  it {should have_many :players}
  describe 'instance methods' do
    before :each do
      @team_1 = Team.create!(name: "Mets", city: "New York",
          playoffs: true, wins: 79, losses: 45)
      @player_1 = @team_1.players.create!(name: "Pete Alonso", position: "First Base",
          free_agent: false, salary: 7400000)
      @player_2 = @team_1.players.create!(name: "Jacob deGrom", position: "Pitcher",
          free_agent: true, salary: 33000000)
      @player_3 = @team_1.players.create!(name: "Fransicso Lindor", position: "Shortstop",
          free_agent: false, salary: 31100000)
      end

      it '#sort players by name' do
        expect(@team_1.sort_players).to eq([@player_3, @player_2, @player_1])
      end
  end
end
