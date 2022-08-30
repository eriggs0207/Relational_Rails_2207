class Team < ApplicationRecord
  has_many :players

  def player_count
    self.players.count
  end

  def sort_players
    self.players.order(:name)
  end

  def min_salary(user_input)
    self.players.where("salary >= ?", user_input)
  end
end
