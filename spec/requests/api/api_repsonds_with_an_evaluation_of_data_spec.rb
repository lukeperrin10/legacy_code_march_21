RSpec.describe 'POST /api/analyses', type: :request do 

  describe 'expects to receive a response' do
    before do
    post '/api/analyses', params: { analysis: {
      category: "text",
      resource: "Hello my friend"
    }}
    end

    it 'is expected to respond with 200' do
      expect(response).to have_http_status 200
    end

    it 'is expected to respond with tag_name clean' do
      expect(JSON.parse(response.body))[results:[classifications: :tag_name]].to eq 'clean'
    end
  end
end