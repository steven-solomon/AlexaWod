require 'rails_helper'

describe WodController, type: :controller do
  #todo: stub wordrepo
  it 'populates wod_name' do
    wod_name = 'wod name'
    date = "2016/12/30"
    allow(WodRepo).to receive(:wod).with(date).and_return(wod_name)

    post 'create', params: request_data_with_date, format: :json

    expect(assigns(:wod_name)).to eq(wod_name)
  end

  context 'no date specified' do
    before do
      Timecop.freeze(Time.local(2016, 12, 29, 0, 0, 0))
    end

    after do
      Timecop.return
    end

    it 'populates wod_name based on today' do
      wod_name = 'wod name'
      date = "2016/12/29"
      allow(WodRepo).to receive(:wod).with(date).and_return(wod_name)

      post 'create', params: request_data_WITHOUT_date, format: :json

      expect(assigns(:wod_name)).to eq(wod_name)
    end
  end

  def request_data_with_date
    {
      "request" => {
        "intent" => {
          "slots" => {
            "Date" => {
              "name" => "Date",
              "value" => "2016-12-30"
            }
          }
        }
      }
    }
  end

  def request_data_WITHOUT_date
    {
      "request" => {
        "intent" => {
          "slots" => {
            "Date" => {
              "name" => "Date"
            }
          }
        }
      }
    }
  end
end
