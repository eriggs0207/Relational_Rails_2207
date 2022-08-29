require 'rails_helper'

RSpec.describe 'team creation' do
  it 'I see a link to create a new team that takes me to the new team form' do
    visit "/teams"

    click_link "Add New Team"

    expect(current_path).to eq('/teams/new')
  end

  it 'can create a new team' do
    visit "/teams/new"

    fill_in("Name", with: "Nationals")
    fill_in("City", with: "Washington")
    fill_in("Wins", with: 42)
    fill_in("Losses", with: 84)
    fill_in("Playoffs", with: false)
    click_button("Add Team")

    expect(current_path).to eq("/teams")
    expect(page).to have_content("Nationals")
  end
end
