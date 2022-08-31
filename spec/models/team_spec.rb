require 'rails_helper'

RSpec.describe Team, type: :model do
  it {should have_many :players}
    before :each do
      @team_1 = Team.create!(name: "Mets", city: "New York",
        playoffs: true, wins: 79, losses: 45, created_at: 5.day.ago)
      @team_2 = Team.create!(name: "Braves", city: "Atlanta",
        playoffs: true, wins: 76, losses: 48, created_at: 10.day.ago)
      @team_3 = Team.create!(name: "Phillies", city: "Philadelphia",
        playoffs: true, wins: 69, losses: 55, created_at: 3.day.ago)
      @player_1 = @team_1.players.create!(name: "Pete Alonso", position: "First Base",
          free_agent: false, salary: 7400000)
      @player_2 = @team_1.players.create!(name: "Jacob deGrom", position: "Pitcher",
          free_agent: true, salary: 33000000)
      @player_3 = @team_1.players.create!(name: "Fransicso Lindor", position: "Shortstop",
          free_agent: false, salary: 31100000)
      @player_4 = @team_1.players.create!(name: "Max Scherzer", position: "Pitcher",
          free_agent: false, salary: 43333333)
      end

    describe 'class methods' do
      it '#sort_by_creation' do
        expect(Team.sort_by_creation).to eq([@team_2, @team_1, @team_3])
      end
    end

    describe 'instance methods' do
      it '#counts players' do
        expect(@team_1.player_count).to eq(4)
      end

      it '#sort players by name' do
        expect(@team_1.sort_players).to eq([@player_3, @player_2, @player_4, @player_1])
      end

      it '#min salary for players' do
        expect(@team_1.min_salary(15000000)).to eq([@player_2, @player_3, @player_4])
      end
    end
  end
