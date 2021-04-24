RSpec.describe 'POST /api/analyses', type: :request do 
  let(:clarifai_responce ) do
    file_fixture('clarifai.json').read
  end
  
  params = { analysis: {
    resource: "https://images.unsplash.com/photo-1606092195730-5d7b9af1efc5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80",
    category: "image"
    }}
  
  describe 'expected to receive a response for valid request ' do
      before do
        stub_request(:post, "https://api.clarifai.com/v2/models/d16f390eb32cad478c7ae150069bd2c6/outputs").
        with(
          body: "{\"inputs\":[{\"data\":{\"image\":{\"url\":\"https://images.unsplash.com/photo-1606092195730-5d7b9af1efc5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8\\u0026ixlib=rb-1.2.1\\u0026auto=format\\u0026fit=crop\\u0026w=1500\\u0026q=80\"}}}]}",
          headers: {
         'Accept'=>'*/*',
         'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
         'Authorization'=>'Key f86af3366e694b41b60d2cf70c5d6ccc',
         'Content-Length'=>'225',
         'Host'=>'api.clarifai.com',
         'User-Agent'=>'rest-client/2.1.0.rc1 (linux-gnu x86_64) ruby/2.5.0p0'
          }).
        to_return(status: 200, body: "", headers: {})
      post '/api/analyses', params: params
      end
   

      it 'is expected to respond 200' do 
        expect(response).to have_http_status 200
      end
  
      # it 'is expected to respond with an evaluated output' do
      #   expect(JSON.parse(response.body)[:results]).to eq JSON.parse(expected_results)[:results]
      # end
      
    end
  end