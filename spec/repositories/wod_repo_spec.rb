describe WodRepo do
  it 'parses wod name' do
    stub_request(:any, 'http://www.crossfitsouthbrooklyn.com/').
      to_return(body: File.new('./spec/test_data/wod_blog.html'), status: 200)

    wod_name = WodRepo.wod
    expect(wod_name).to eql("Rest Day")
  end
end
