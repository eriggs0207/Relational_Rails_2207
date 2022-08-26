require 'rails_helper'

RSpec.describe 'players index page', type: :feature do
  before :each do
    @team_1 = Team.create!(name: "Mets", city: "New York",
        playoffs: true, wins: 79, losses: 45)
    @team_2 = Team.create!(name: "Braves", city: "Atlanta",
        playoffs: true, wins: 76, losses: 48)
    @player_1 = @team_1.players.create!(name: "Pete Alonso", position: "First Base",
        free_agent: false, salary: 7400000)
    @player_2 = @team_1.players.create!(name: "Jacob deGrom", position: "Pitcher",
        free_agent: true, salary: 33000000)
    @player_3 = @team_2.players.create!(name: "Ronald Acuna Jr", position: "Center Field",
        free_agent: false, salary: 12500000)
      end

  describe 'as a user' do
    describe 'when I visit/players' do
      it 'I see the name of each player record in the system' do
        visit '/players'

        expect(page).to have_content(@player_1.name)
        expect(page).to have_content(@player_2.name)
        expect(page).to have_content(@player_3.name)
      end

      it 'shows all the players attributes' do
        visit '/players'

        expect(page).to have_content("Team: #{@player_1.team.city} #{@player_1.team.name}")
        expect(page).to have_content("Team: #{@player_2.team.city} #{@player_2.team.name}")
        expect(page).to have_content("Team: #{@player_3.team.city} #{@player_3.team.name}")
        expect(page).to have_content("Salary: #{@player_1.salary}")
        expect(page).to have_content("Salary: #{@player_2.salary}")
        expect(page).to have_content("Salary: #{@player_3.salary}")
        expect(page).to have_content("Free Agent Next Season: #{@player_1.free_agent}")
        expect(page).to have_content("Free Agent Next Season: #{@player_2.free_agent}")
        expect(page).to have_content("Free Agent Next Season: #{@player_3.free_agent}")
      end
    end
  end
end
