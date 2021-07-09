class OrdersController < ApplicationController
  before_action :set_order, only: %i[show]
  before_action :authorize!

  def index
    @orders = Order.all

    render json: serializer.new(@orders)
  end

  def show
    render json: serializer.new(@order)
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def serializer
    OrderSerializer
  end
end
