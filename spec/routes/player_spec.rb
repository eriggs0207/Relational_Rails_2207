require 'rails_helper'

RSpec.describe Player, type: :routing do
  it '#index' do
    expect(:get => "/players").to route_to(
      :controller => "players",
      :action => "index",
    )
    end
  end 
