class ProductsController < ApplicationController
  before_action :set_product, only: %i[show update destroy]
  before_action :authorize!

  def index
    @products = Product.all

    render json: serializer.new(@products)
  end

  def show
    render json: serializer.new(@product)
  end

  def create
    @product = Product.build(routine_params)

    if @product.save
      render json: serializer.new(@product), status: :created, location: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  def update
    if @product.update(product_params)
      render json: serializer.new(@product)
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params
      .require(:data)
      .require(:attributes)
      .permit(:name, :price) || ApplicationController::Parameters.new
  end

  def serializer
    ProductSerializer
  end
end
