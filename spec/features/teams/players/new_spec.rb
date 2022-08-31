require 'rails_helper'

RSpec.describe 'player creation' do
  before :each do
    @team_1 = Team.create!(name: "Mets", city: "New York",
      playoffs: true, wins: 79, losses: 45)
    @player_1 = @team_1.players.create!(name: "Pete Alonso", position: "First Base",
      free_agent: false, salary: 7400000)
    @player_2 = @team_1.players.create!(name: "Jacob deGrom", position: "Pitcher",
      free_agent: true, salary: 33000000)
    end

  describe 'as a user' do
    describe 'when I visit/teams/:id/players' do
      it 'has a link to create a new player that takes me to the new player form' do
        visit "/teams/#{@team_1.id}/players"

        click_link "Add New Player"

        expect(current_path).to eq("/teams/#{@team_1.id}/players/new")
      end

      it 'can create a new player on a team' do
        visit "/teams/#{@team_1.id}/players/new"

        fill_in "Name", with: "Max Scherzer"
        fill_in "Position", with: "Pitcher"
        choose with: false
        fill_in "Salary", with: 43333333
        click_button"Add Player"

        expect(current_path).to eq("/teams/#{@team_1.id}/players")
        expect(page).to have_content("Max Scherzer")
        expect(page).to have_content(false)
        expect(page).to have_content("Pitcher")
        expect(page).to have_content(43333333)
      end
    end
  end
end 
