class TeamsController < ApplicationController
  def index
    @teams = Team.order("created_at")
  end

  def new
  end

  def create
    team = Team.create(team_params)
    redirect_to "/teams"
  end

  def team_params
    params.permit(:name, :city, :wins, :losses, :playoffs)
  end

  def show
    @team = Team.find(params[:id])
  end

end
