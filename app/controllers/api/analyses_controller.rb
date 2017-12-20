class Api::AnalysesController < ApplicationController
  before_action :analyze_resource, only: [:create]

  def create
    analysis = Analysis.create(analysis_params
                                   .merge!(results: @results,
                                           request_ip: request.remote_ip))
    if analysis.persisted?
      render json: analysis
    else
      render json: analysis.errors.full_messages
    end

  end

  private

  def analysis_params
    params.require(:analysis).permit!
  end

  def analyze_resource
    resource = analysis_params[:resource]
    if analysis_category == :image
      @results = image_analysis(resource)
    elsif analysis_category == :text
      @results = text_analysis(resource)
    end
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

  def analysis_category
    analysis_params[:category].to_sym
  end
end
