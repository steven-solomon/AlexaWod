require 'rails_helper'

describe WodController, type: :controller do
  it 'populates wod_name' do
    wod_name = 'wod name'
    allow(WodRepo).to receive(:wod).and_return(wod_name)

    post 'create', format: :json

    expect(assigns(:wod_name)).to eq(wod_name)
  end
end
