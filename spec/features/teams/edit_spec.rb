require 'rails_helper'

RSpec.describe 'the team edit' do
  before :each do
    @team_1 = Team.create!(name: "Mets", city: "New York",
      playoffs: true, wins: 79, losses: 45)
    @team_2 = Team.create!(name: "Braves", city: "Atlanta",
      playoffs: true, wins: 76, losses: 48)
    end

  it 'I see a link to update the team' do
    visit "/teams/#{@team_1.id}"

    click_button "Edit #{@team_1.city} #{@team_1.name}"
    expect(current_path).to eq("/teams/#{@team_1.id}/edit")

    visit "/teams/#{@team_2.id}"

    click_button "Edit #{@team_2.city} #{@team_2.name}"
    expect(current_path).to eq("/teams/#{@team_2.id}/edit")
  end

  it 'can edit the team' do
    team_6 = Team.create!(name: "Cubbies", city: "Chicago",
      playoffs: false, wins: 45, losses: 79)

    visit "/teams/#{team_6.id}"

    expect(page).to have_content('Chicago Cubbies')
    click_button 'Edit Chicago Cubbies'

    fill_in 'Name', with: 'Cubs'
    click_button 'Update Team'
    
    expect(current_path).to eq("/teams/#{team_6.id}")
    expect(page).to have_content('Cubs')
  end
end
