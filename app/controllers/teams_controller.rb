class TeamsController < ApplicationController
  def index
    @teams = Team.order("created_at")
  end

  def show
    @team = Team.find(params[:id])
  end
end
