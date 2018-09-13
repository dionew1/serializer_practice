class Api::V1::StoresController < ApplicationController

  def index
    render json: Store.all.includes(:orders, :pets)
  end

  def show
    render json: Store.find(params[:id])
  end

end
