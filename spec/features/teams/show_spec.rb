require 'rails_helper'

RSpec.describe 'teams show page', type: :feature do
  before :each do
    @team_1 = Team.create!(name: "Mets", city: "New York",
      playoffs: true, wins: 79, losses: 45)
    @team_2 = Team.create!(name: "Braves", city: "Atlanta",
      playoffs: true, wins: 76, losses: 48)
    @player_1 = @team_1.players.create!(name: "Pete Alonso", position: "First Base",
      free_agent: false, salary: 7400000)
    @player_2 = @team_1.players.create!(name: "Jacob deGrom", position: "Pitcher",
      free_agent: true, salary: 33000000)
    end

  describe 'as a user' do
    describe 'when I visit/teams/:id' do
      it 'I see the team with that id' do
        visit "/teams/#{@team_1.id}"

        expect(page).to have_content(@team_1.name)
        expect(page).to_not have_content(@team_2.name)
      end

      it 'I see all of the team attributes' do
        visit "/teams/#{@team_1.id}"

        expect(page).to have_content(@team_1.city)
        expect(page).to have_content("Record: #{@team_1.wins} - #{@team_1.losses}")
        expect(page).to have_content("Playoff Team: #{@team_2.playoffs}")
      end

      it 'I see a count of players on team' do
        visit "/teams/#{@team_1.id}"

        expect(page).to have_content("Players on Roster: #{@team_1.players.count}")
      end

      it 'I see a link at the top of the page that takes me to players index' do
        visit "/teams/#{@team_1.id}"

        click_on "Mlb Players"

        expect(current_path).to eq('/players')
      end

      it 'I see a link at the top of the page that takes me to players index' do
        visit "/teams/#{@team_1.id}"

        click_on "Mlb Teams"

        expect(current_path).to eq('/teams')
      end

      it 'I see a link to take me to that teams players page' do
        visit "/teams/#{@team_1.id}"

        click_on "Current Players"
        
        expect(current_path).to eq("/teams/#{@team_1.id}/players")
      end
    end
  end
end
