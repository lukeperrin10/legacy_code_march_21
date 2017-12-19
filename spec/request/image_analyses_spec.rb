RSpec.describe Api::ImageAnalysesController, type: :request do

  it 'let us have a test' do
    post '/api/image_analyses', params: { analysis: {random: :param}}
    binding.pry
  end
end