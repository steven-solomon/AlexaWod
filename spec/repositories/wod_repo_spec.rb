describe WodRepo do
  it 'parses rest day' do
    stub_request(:any, 'http://crossfitsouthbrooklyn.com/workout-of-the-day/rss.xml').
      to_return(body: File.new('./spec/test_data/rest_day.rss'), status: 200)

    wod_name = WodRepo.wod
    expect(wod_name).to eql("Rest Day")
  end

  it 'parses cleans' do
    stub_request(:any, 'http://crossfitsouthbrooklyn.com/workout-of-the-day/rss.xml').
      to_return(body: File.new('./spec/test_data/cleans.rss'), status: 200)

    wod_name = WodRepo.wod
    expect(wod_name).to eql("Clean Metcon")
  end
end
