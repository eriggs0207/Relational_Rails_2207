class Team < ApplicationRecord
  has_many :players

  def sort_players
    self.players.order(:name)
  end
end
