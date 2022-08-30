require 'rails_helper'

RSpec.describe 'Team players index' do
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

  describe 'as a user' do
    describe 'when I visit/teams' do
      it 'shows all the players on that team and their attributes' do
        visit "/teams/#{@team_1.id}/players"

        expect(page).to have_content(@player_1.name)
        expect(page).to have_content(@player_3.position)
        expect(page).to have_content("Salary: #{@player_2.salary}")
        expect(page).to have_content("Free Agent Next Season: #{@player_1.free_agent}")
      end

      it 'I see a link at the top of the page that takes me to players index' do
        visit "/teams/#{@team_1.id}/players"

        click_on "Mlb Players"

        expect(current_path).to eq('/players')
      end

      it 'I see a link at the top of the page that takes me to players index' do
        visit "/teams/#{@team_1.id}/players"

        click_on "Mlb Teams"

        expect(current_path).to eq('/teams')
      end

      it 'I see a link to sort players that returns players in alphabetical order' do
        visit "/teams/#{@team_1.id}/players"

        click_on "Sort Players"

        expect(current_path).to eq("/teams/#{@team_1.id}/players")
        expect(page.find(id: "0")).to have_content(@player_3.name)
        expect(page.find(id: "1")).to have_content(@player_2.name)
        expect(page.find(id: "2")).to have_content(@player_1.name)
      end

      it "I see a form that takes a number value" do
        visit "/teams/#{@team_1.id}/players"

        expect(page).to have_field("min_salary")
        expect(page).to have_button("Update Players")
        fill_in("min_salary", with: 25000000)
        click_button "Update Players"

        expect(current_path).to eq("/teams/#{@team_1.id}/players")
        expect(page).to have_no_content(@player_1.name)
        expect(page).to have_content(@player_2.salary)
        expect(page).to have_content(@player_3.position)

      end
    end
  end
end
