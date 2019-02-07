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

  def create
    mix = Mix.create(mix_params)
    render json: mix
  end

  private

  def mix_params
    params.require(:mix).permit(:title, :url)
  end

end
