json.version '1.0'
json.sessionAttributes({})
json.response do
  json.outputSpeech do
    json.type 'PlainText'
    json.text "Today is #{@wod_name}, Steven"
  end
end

json.shouldEndSession true
