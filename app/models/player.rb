class Player < ApplicationRecord
  belongs_to :team

  def self.current_free_agents
    Player.where(free_agent: true)
  end
end
