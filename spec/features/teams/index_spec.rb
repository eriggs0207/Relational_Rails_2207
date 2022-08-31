require 'rails_helper'

RSpec.describe 'teams index page', type: :feature do
  before :each do
    @team_1 = Team.create!(name: "Mets", city: "New York",
      playoffs: true, wins: 79, losses: 45, created_at: 5.day.ago)
    @team_2 = Team.create!(name: "Braves", city: "Atlanta",
      playoffs: true, wins: 76, losses: 48, created_at: 4.day.ago)
    @team_3 = Team.create!(name: "Phillies", city: "Philadelphia",
      playoffs: true, wins: 69, losses: 55, created_at: 3.day.ago)
    @team_4 = Team.create!(name: "Marlins", city: "Miami",
      playoffs: false, wins: 54, losses: 70, created_at: 2.day.ago)
    end

  describe 'as a user' do
    describe 'when I visit/teams' do
      it 'has the name of each team record in the system' do
        visit '/teams'

        expect(page).to have_content(@team_1.name)
        expect(page).to have_content(@team_1.city)
        expect(page).to have_content("Record: #{@team_1.wins} - #{@team_1.losses}")
        expect(page).to have_content("Playoff Team: #{@team_1.playoffs}")
        expect(page).to have_content(@team_2.name)
        expect(page).to have_content(@team_2.city)
        expect(page).to have_content("Record: #{@team_2.wins} - #{@team_2.losses}")
        expect(page).to have_content("Playoff Team: #{@team_2.playoffs}")
      end

      it 'has each team ordered by mostly recently created with timestamp' do
        visit '/teams'

        expect(page.find(id: "0")).to have_content(@team_1.name)
        expect(page.find(id: "1")).to have_content(@team_2.name)
        expect(page.find(id: "2")).to have_content(@team_3.name)
        expect(page.find(id: "3")).to have_content(@team_4.name)
        expect(page.find(id: "0")).to have_content(@team_1.created_at)
        expect(page.find(id: "1")).to have_content(@team_2.created_at)
        expect(page.find(id: "2")).to have_content(@team_3.created_at)
        expect(page.find(id: "3")).to have_content(@team_4.created_at)
      end

      it 'has a link at the top of the page that takes me to /players' do
        visit '/teams'

        click_on "Mlb Players"

        expect(current_path).to eq('/players')
      end

      it 'has a link at the top of the page that takes me to /teams' do
        visit "/teams"

        click_on "Mlb Teams"

        expect(current_path).to eq('/teams')
      end
    end
  end
end
