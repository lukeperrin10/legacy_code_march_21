RSpec.describe Api::ImageAnalysesController, type: :request do

  it 'let us have a test' do
    post '/api/image_analyses', params: {analysis: {url: 'https://c.tadst.com/gfx/1200x630/sunrise-sunset-sun-calculator.jpg?1',
                                                    category: :image}}
    binding.pry
  end
end