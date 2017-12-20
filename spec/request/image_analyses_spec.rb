RSpec.describe Api::AnalysesController, type: :request do

  it 'responds with an image analysis' do
    post '/api/analyses', params: {analysis: {resource: 'https://c.tadst.com/gfx/1200x630/sunrise-sunset-sun-calculator.jpg?1',
                                              category: :image}}
    expect(response.status).to eq 200
  end

  it 'responds with an text analysis' do
    post '/api/analyses', params: {analysis: {resource: 'This is awesome',
                                              category: :text}}
    expect(response.status).to eq 200
  end
end