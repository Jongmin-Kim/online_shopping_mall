class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      flash[:alert]= @product.errors.full_message
      render 'new'
    end
  end
  def show
    @product = Product.find(params[:id])
  end

  private
    def product_params
      params.require(:product).permit(:name, :description, :price)
    end
end
