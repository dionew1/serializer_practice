class Api::V1::OrdersController < ApplicationController
  before_action :set_store

  def index
    render json: Order.where(store_id: @store.id)
  end

  def show
    order = Order.find(params[:id])
    if order.store_id == @store.id
      render json: order
    else
      render text: "404 Not found", status: 404
    end
  end

  private
    def set_store
      @store = Store.find(params[:store_id])
    end
end
