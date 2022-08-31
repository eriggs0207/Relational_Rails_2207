require 'rails_helper'

RSpec.describe 'players show page', type: :feature do
  before :each do
    @team_1 = Team.create!(name: "Mets", city: "New York",
      playoffs: true, wins: 79, losses: 45)
    @player_1 = @team_1.players.create!(name: "Pete Alonso", position: "First Base",
        free_agent: false, salary: 7400000)
    @player_2 = @team_1.players.create!(name: "Jacob deGrom", position: "Pitcher",
        free_agent: true, salary: 33000000)
    end

  describe 'as a user' do
    describe 'when I visit/players/:id' do
      it 'has the players with that id' do

        visit "/players/#{@player_1.id}"

        expect(page).to have_content(@player_1.name)
        expect(page).to_not have_content(@player_2.name)
      end

      it 'has the players attributes' do

        visit "/players/#{@player_1.id}"

        expect(page).to have_content("Team: #{@player_1.team.city} #{@player_1.team.name}")
        expect(page).to have_content("Salary: #{@player_1.salary}")
        expect(page).to have_content("Free Agent Next Season: #{@player_1.free_agent}")
      end

      it 'has a link at the top of the page that takes me to /players' do
        visit "/players/#{@player_1.id}"

        click_on "Mlb Players"

        expect(current_path).to eq('/players')
      end

      it 'has a link at the top of the page that takes me to /players/:id' do
        visit "/players/#{@player_1.id}"

        click_on "Mlb Teams"

        expect(current_path).to eq('/teams')
      end
    end
  end
end
