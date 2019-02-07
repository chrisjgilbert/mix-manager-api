class Api::V1::MixesController < ApplicationController

  def index
    render json: Mix.all
  end

end
