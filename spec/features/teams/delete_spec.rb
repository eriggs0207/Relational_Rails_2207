require 'rails_helper'

RSpec.describe 'the team delete' do
  before :each do
    @team_1 = Team.create!(name: "Mets", city: "New York",
      playoffs: true, wins: 79, losses: 45)
    @team_2 = Team.create!(name: "Braves", city: "Atlanta",
      playoffs: true, wins: 76, losses: 48)
    end

  it 'I see a link to delete the team' do
    visit "/teams/#{@team_1.id}"

    click_button "Delete #{@team_1.city} #{@team_1.name}"
    expect(current_path).to eq("/teams")

    expect(page).to have_no_content(@team_1.name)
    expect(page).to have_content(@team_2.wins)

  end

  it 'I see a link to delete the team' do
    visit "/teams"

    click_button "Delete #{@team_1.city} #{@team_1.name}"
    expect(current_path).to eq("/teams")

    expect(page).to have_no_content(@team_1.name)
    expect(page).to have_content(@team_2.wins)

  end
end
