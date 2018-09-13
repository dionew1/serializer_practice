class Api::V1::PetsController < ApplicationController
  def index
    render json: Pet.all.includes(:store)
  end

  def show
    render json: Pet.find(params[:id])
  end
end
