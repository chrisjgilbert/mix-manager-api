class Api::V1::MixesController < ApplicationController

  # GET /api/v1/mixes
  def index
    render json: Mix.all
  end

  # GET /api/v1/mixes/:id
  def show
    mix = Mix.find(params[:id])
    render json: mix
  end

end
