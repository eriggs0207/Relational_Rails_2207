require 'rails_helper'

RSpec.describe 'the player edit' do
  before :each do
    @team_1 = Team.create!(name: "Mets", city: "New York",
      playoffs: true, wins: 79, losses: 45)
    @player_1 = @team_1.players.create!(name: "Pete Alonso", position: "First Base",
      free_agent: true, salary: 7400000)
    @player_2 = @team_1.players.create!(name: "Jacob deGrom", position: "Pitcher",
      free_agent: true, salary: 33000000)
    end

  describe 'as a user' do
    describe 'when I visit/players/:id' do
      it "has a link to update the player" do
        visit "/players/#{@player_1.id}"

        click_button "Edit #{@player_1.name}"
        expect(current_path).to eq("/players/#{@player_1.id}/edit")

        visit "/players/#{@player_2.id}"

        click_button "Edit #{@player_2.name}"
        expect(current_path).to eq("/players/#{@player_2.id}/edit")
      end

      it 'can update a player' do
        player_3 = @team_1.players.create!(name: "Frankie Lindor", position: "Shortstop",
          free_agent: true, salary: 34000000)

        visit "/players/#{player_3.id}"

        expect(page).to have_content('Frankie Lindor')
        click_button 'Edit Frankie Lindor'

        fill_in 'Name', with: 'Francisco Lindor'
        fill_in 'Salary', with: 33100000
        click_button 'Update Player'

        expect(current_path).to eq("/players/#{player_3.id}")
        expect(page).to have_content('Francisco Lindor')
        expect(page).to have_content(33100000)
      end
    end

    describe 'when I visit/players/' do
      it "has a link to update the player" do
        visit "/players"

        click_button "Edit #{@player_1.name}"
        expect(current_path).to eq("/players/#{@player_1.id}/edit")

        visit "/players"

        click_button "Edit #{@player_2.name}"
        expect(current_path).to eq("/players/#{@player_2.id}/edit")
      end

      it 'can update a player' do
        player_3 = @team_1.players.create!(name: "Frankie Lindor", position: "Shortstop",
          free_agent: true, salary: 34000000)

        visit "/players"

        expect(page).to have_content('Frankie Lindor')
        click_button 'Edit Frankie Lindor'

        fill_in 'Name', with: 'Francisco Lindor'
        fill_in 'Position', with: 'Second Base'
        click_button 'Update Player'

        expect(current_path).to eq("/players/#{player_3.id}")
        expect(page).to have_content('Francisco Lindor')
        expect(page).to have_content('Second Base')
      end
    end

    describe 'when I visit/team/:id/players' do
      it "has a link to update the player" do
        visit "/teams/#{@team_1.id}/players"

        click_button "Edit #{@player_1.name}"
        expect(current_path).to eq("/players/#{@player_1.id}/edit")

        visit "/teams/#{@team_1.id}/players"

        click_button "Edit #{@player_2.name}"
        expect(current_path).to eq("/players/#{@player_2.id}/edit")
      end

      it 'can update a player' do
        player_3 = @team_1.players.create!(name: "Frankie Lindor", position: "Shortstop",
          free_agent: true, salary: 34000000)

        visit "/teams/#{@team_1.id}/players"

        expect(page).to have_content('Frankie Lindor')
        click_button 'Edit Frankie Lindor'

        fill_in 'Name', with: 'Francisco Lindor'
        choose with: false
        click_button 'Update Player'

        expect(current_path).to eq("/players/#{player_3.id}")
        expect(page).to have_content('Francisco Lindor')
        expect(page).to have_content(false)
      end
    end
  end
end
