require 'rails_helper'

describe 'wod request', type: :feature do
  it 'returns wod for today' do
    stub_request(:any, 'http://crossfitsouthbrooklyn.com/workout-of-the-day/rss.xml').
      to_return(body: File.new('./spec/test_data/rest_day.rss'), status: 200)

    response = HTTParty.post '/wod', body: json_data, headers: { 'Content-Type' => 'application/json'}

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
      'session' =>  {
        'sessionId' => 'some session id',
        'application' => {
          'applicationId' => 'some app id'
        },
        'attributes' => {},
        'user' => {
          'userId' => 'some user id'
        },
        'new' => true
      },
      'request' => {
        'type' => 'IntentRequest',
        'requestId' => 'EdwRequestId.5cb88491-ded1-4052-a12a-b4fb26ec6d51',
        'locale' => 'en-US',
        'timestamp' => '2016-12-30T21:23:08Z',
        'intent' => {
          'name' => 'Crossfit',
          'slots' => {
            'Date' => {
              'name' => 'Date',
              'value' => '2016-12-30'
            }
          }
        }
      },
      'version' => '1.0'
    }
  end
end
