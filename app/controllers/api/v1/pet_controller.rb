class Api::V1::PetController < ApplicationController
  def show
    render json: Pet.find(params[:id])
  end
end
