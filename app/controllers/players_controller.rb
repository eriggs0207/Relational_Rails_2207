class PlayersController < ApplicationController
  def index
    @players = Player.current_free_agents

  end

  def show
    @player = Player.find(params[:id])
  end

  def edit
    @player = Player.find(params[:id])
  end

  def update
    @player = Player.find(params[:id])
    @player.update(player_params)
    redirect_to "/players/#{@player.id}"
  end

  def destroy
    @player = Player.destroy(params[:id])
    redirect_to "/players"
  end

private
  def player_params
    params.permit(:name, :position, :free_agent, :salary)
  end
end
