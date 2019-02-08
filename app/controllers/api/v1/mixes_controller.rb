class Api::V1::MixesController < ApplicationController

  before_action :find_mix, only: [:show, :update, :destroy]

  def index
    render json: Mix.all
  end

  def show
    render json: @mix
  end

  def create
    mix = Mix.create(mix_params)
    render json: mix
  end

  def update
    @mix.update(mix_params)
  end

  def destroy
    @mix.destroy
  end

  private

  def mix_params
    params.require(:mix).permit(:title, :url, :tag_list)
  end

  def find_mix
    @mix = Mix.find(params[:id])
  end

end
