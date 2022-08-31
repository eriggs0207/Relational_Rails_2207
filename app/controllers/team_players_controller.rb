class TeamPlayersController < ApplicationController

  def index
    @team = Team.find(params[:team_id])
    if params[:sort_players].present?
      @players = @team.sort_players
    elsif params[:min_salary].present?
      @players = @team.min_salary(params[:min_salary])
    else
      @players = @team.players
    end
  end

  def new
    @team = Team.find(params[:team_id])
  end

  def create
    @team = Team.find(params[:team_id])
    player = @team.players.create(player_params)
    redirect_to "/teams/#{@team.id}/players"
  end

private
  def player_params
    params.permit(:name, :position, :free_agent, :salary)
  end
end
