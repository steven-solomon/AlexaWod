require 'rails_helper'

describe 'wod request', type: :request do
  it 'returns wod' do
    stub_request(:any, 'http://crossfitsouthbrooklyn.com/workout-of-the-day/rss.xml').
      to_return(body: File.new('./spec/test_data/rest_day.rss'), status: 200)

    post '/wod', json_data

    expect(response).to have_http_status(:ok)
    expect(JSON.parse(response.body)).to eq(json_response)
  end

  def json_response
    {
      'version' => '1.0',
      'response' => {
        'outputSpeech' => {
          'type' => 'PlainText',
          'text' => 'Today is Rest Day, Steven'
        }
      },
      'sessionAttributes' => {},
      'shouldEndSession' => true
    }
  end

  def json_data
    {
      "session" =>  {
        "sessionId" => "some session id",
        "application" => {
          "applicationId" => "some app id"
        },
        "attributes" => {},
        "user" => {
          "userId" => "some user id"
        },
        "new" => true
      },
      "request" => {
        "type" => "IntentRequest",
        "requestId" => "EdwRequestId.5cb88491-ded1-4052-a12a-b4fb26ec6d51",
        "locale" => "en-US",
        "timestamp" => "2016-12-30T21:23:08Z",
        "intent" => {
          "name" => "Crossfit",
          "slots" => {}
        }
      },
      "version" => "1.0"
    }
  end
end
