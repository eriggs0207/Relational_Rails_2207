class Player < ApplicationRecord
  belongs_to :team

  # def current_free_agents
  #   self.where(free_agent: true)
  # end

end
