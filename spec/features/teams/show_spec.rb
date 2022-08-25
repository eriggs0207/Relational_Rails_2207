require 'rails_helper'

RSpec.describe 'teams show page', type: :feature do
  describe 'as a user' do
    describe 'when I visit/teams/:id' do
      it 'I see the team with that id' do
        team_1 = Team.create!(name: "Mets", city: "New York",
          playoffs: true, wins: 79, losses: 45)
        team_2 = Team.create!(name: "Braves", city: "Atlanta",
          playoffs: true, wins: 76, losses: 48)

          visit "/teams/#{team_1.id}"

        expect(page).to have_content(team_1.name)
        expect(page).to_not have_content(team_2.name)
      end

      it 'I see all of the team attributes' do
        team_1 = Team.create!(name: "Mets", city: "New York",
          playoffs: true, wins: 79, losses: 45)
        team_2 = Team.create!(name: "Braves", city: "Atlanta",
          playoffs: true, wins: 76, losses: 48)

          visit "/teams/#{team_1.id}"
          save_and_open_page
        expect(page).to have_content(team_1.city)
        expect(page).to have_content("Record: #{team_1.wins} - #{team_1.losses}")
        expect(page).to have_content("Playoff Team: #{team_2.playoffs}")
      end
    end
  end
end
