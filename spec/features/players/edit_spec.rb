require 'rails_helper'

RSpec.describe 'the team edit' do
  before :each do
    @team_1 = Team.create!(name: "Mets", city: "New York",
      playoffs: true, wins: 79, losses: 45)
    @player_1 = @team_1.players.create!(name: "Pete Alonso", position: "First Base",
      free_agent: false, salary: 7400000)
    @player_2 = @team_1.players.create!(name: "Jacob deGrom", position: "Pitcher",
      free_agent: true, salary: 33000000)
    end

    it "I see a link to update the player" do
      visit "/players/#{@player_1.id}"

      click_button "Edit #{@player_1.name}"
      expect(current_path).to eq("/players/#{@player_1.id}/edit")

      visit "/players/#{@player_2.id}"

      click_button "Edit #{@player_2.name}"
      expect(current_path).to eq("/players/#{@player_2.id}/edit")
    end

    it 'can update a player' do
      player_3 = @team_1.players.create!(name: "Frankie Lindor", position: "Shortstop",
        free_agent: false, salary: 34000000)

      visit "/players/#{player_3.id}"

      expect(page).to have_content('Frankie Lindor')
      click_button 'Edit Frankie Lindor'

      fill_in 'Name', with: 'Francisco Lindor'
      click_button 'Update Player'

      expect(current_path).to eq("/players/#{player_3.id}")
      expect(page).to have_content('Francisco Lindor')
    end


  end
