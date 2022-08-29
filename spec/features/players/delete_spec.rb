require 'rails_helper'

RSpec.describe 'the team delete' do
  before :each do
    @team_1 = Team.create!(name: "Mets", city: "New York",
      playoffs: true, wins: 79, losses: 45)
    @player_1 = @team_1.players.create!(name: "Pete Alonso", position: "First Base",
      free_agent: true, salary: 7400000)
    @player_2 = @team_1.players.create!(name: "Jacob deGrom", position: "Pitcher",
      free_agent: true, salary: 33000000)
    end

  it 'I see a link to delete the team' do
    visit "/players/#{@player_1.id}"

    click_button "Delete #{@player_1.name}"
    expect(current_path).to eq("/players")

    expect(page).to have_no_content(@player_1.name)
    expect(page).to have_content(@player_2.salary)

  end
end
