class Team < ApplicationRecord
  has_many :players

  def self.sort_by_creation
    Team.order("created_at")
  end

  def player_count
    self.players.count
  end

  def sort_players
    self.players.order(:name)
  end

  def min_salary(salary_num)
    self.players.where("salary >= ?", salary_num)
  end
end
