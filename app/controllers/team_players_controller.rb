class TeamPlayersController < ApplicationController
  def index
    @team = Team.find(params[:team_id])
    @players = @team.players
  end

  def new
    @team = Team.find(params[:team_id])
  end

  def create
    @team = Team.find(params[:team_id])
    player = @team.players.create(player_params)
    redirect_to "/teams/#{@team.id}/players"
  end


  def player_params
    params.permit(:name, :position, :free_agent, :salary)
  end
end
