describe WodRepo do
  it 'parses rest day' do
    stub_request(:any, 'http://www.crossfitsouthbrooklyn.com/').
      to_return(body: File.new('./spec/test_data/rest_day.html'), status: 200)

    wod_name = WodRepo.wod
    expect(wod_name).to eql("Rest Day")
  end

  it 'parses cleans' do
    stub_request(:any, 'http://www.crossfitsouthbrooklyn.com/').
      to_return(body: File.new('./spec/test_data/cleans.html'), status: 200)

    wod_name = WodRepo.wod
    expect(wod_name).to eql("Clean Metcon")
  end
end
