class Api::ImageAnalysesController < ApplicationController

  def create

    # hit the clarifai api
    results = Clarifai::Rails::Detector.new(analysis_params[:url]).image

    # save the results in db
    analysis = Analysis.create(analysis_params)
    analysis.update_attribute(:results, results.concepts_with_percent)
    # render a response to client
    render json: analysis
  end

  private

  def analysis_params
    params.require(:analysis).permit!
  end
end
