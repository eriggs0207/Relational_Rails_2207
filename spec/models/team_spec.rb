require 'rails_helper'

RSpec.describe Team, type: :model do
  it {should have_many :players}

  describe 'instance methods' do
    before :each do
      @team_1 = Team.create!(name: "Mets", city: "New York",
        playoffs: true, wins: 79, losses: 45)
      @team_2 = Team.create!(name: "Braves", city: "Atlanta",
        playoffs: true, wins: 76, losses: 48)
      @team_3 = Team.create!(name: "Phillies", city: "Philadelphia",
        playoffs: true, wins: 69, losses: 55)
      @team_4 = Team.create!(name: "Marlins", city: "Miami",
        playoffs: false, wins: 54, losses: 70)
    end
  end 
end
