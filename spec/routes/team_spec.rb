require 'rails_helper'

RSpec.describe Team, type: :routing do
  it '#index' do
    expect(:get => "/teams").to route_to(
      :controller => "teams",
      :action => "index",

    )
  end
end
