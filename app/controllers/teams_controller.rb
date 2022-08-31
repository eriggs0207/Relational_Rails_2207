class TeamsController < ApplicationController

  def index
    @teams = Team.sort_by_creation    
  end

  def new
  end

  def create
    team = Team.create(team_params)
    redirect_to "/teams"
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    @team.update(team_params)
    redirect_to "/teams/#{@team.id}"
  end

  def show
    @team = Team.find(params[:id])
  end

  def destroy
    @team = Team.destroy(params[:id])
    redirect_to "/teams"
  end

private
  def team_params
    params.permit(:name, :city, :wins, :losses, :playoffs)
  end


end
