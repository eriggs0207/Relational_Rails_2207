require 'rails_helper'

RSpec.describe Player, type: :routing do
  it '#index' do
    expect(:get => "/players").to route_to(
      :controller => "players",
      :action => "index",
    )
    end
  it '#show' do
    expect(:get => "/players/:id").to route_to(
      :controller => "players",
      :action => "show",
      :id => ":id",
      )

    end
  end
