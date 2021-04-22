RSpec.describe 'POST /api/analyses', type: :request do 
  let(:expected_response) do
    file_fixture('clarifai.json').read
  end
  
  params = { analysis: {
    resource: "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fG1hbnxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80",
    category: "image"
    }}
  
  describe 'expected to receive a response for valid request ' do
      before do
        stub_request(:post, "https://api.clarifai.com/v2/models/d16f390eb32cad478c7ae150069bd2c6/outputs").
        to_return(status: 200, body: expected_response)
        post '/api/analyses', params: params
      end
   
      it 'is expected to respond with 200' do
        expect(response).to have_http_status 200
      end
  
      it 'is expected to respond with an evaluated output' do
        expect(JSON.parse(response.body)).to eq (expected_response)
      end
      
    end
  end