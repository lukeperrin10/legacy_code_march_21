class Api::ImageAnalysesController < ApplicationController

  def create
    binding.pry
    # sanitize the params

    # hit the clarifai api

    # save the results in db

    # render a response to client
  end

  private

  def analysis_params
    params.require(:analysis).permit!
  end
end
