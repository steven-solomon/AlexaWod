describe WodRepo do
  before do
    stub_request(:any, 'http://crossfitsouthbrooklyn.com/workout-of-the-day/rss.xml').
      to_return(body: File.new(work_out_file), status: 200)
  end

  context 'when it is rest day' do
    let(:work_out_file) { './spec/test_data/rest_day.rss' }

    it 'returns rest day' do
      expect(WodRepo.wod).to eql("Rest Day")
    end
  end

  context 'when it is cleans day' do
    let(:work_out_file) { './spec/test_data/cleans.rss' }

    it 'parses cleans' do
      wod_name = WodRepo.wod
      expect(wod_name).to eql("Clean Metcon")
    end
  end
end
