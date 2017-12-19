class Api::ImageAnalysesController < ApplicationController

  def create
    if analysis_params[:category].to_sym == :image
      results = image_analysis(analysis_params[:url])
    elsif analysis_params[:category].to_sym == :text
      results = text_analysis(analysis_params[:text])
    end
    # save the results in db
    analysis = Analysis.create(analysis_params)
    analysis.update_attribute(:results, results)
    # render a response to client
    render json: analysis
  end

  private

  def analysis_params
    params.require(:analysis).permit!
  end

  def text_analysis(text)
    url = URI.parse('https://nehac-ml-analyzer.p.mashape.com/adult')
    url.query = URI.encode_www_form(text: text)
    credentials = {x_mashape_key: ENV['ML_ANALYZER_KEY'],
                   accept: 'application/json'}
    response = RestClient.get(url.to_s, headers = credentials)
    JSON.parse(response.body)
  end

  def image_analysis(url)
    Clarifai::Rails::Detector
        .new(url)
        .image
        .concepts_with_percent
  end
end
