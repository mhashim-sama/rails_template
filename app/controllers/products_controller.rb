class ProductsController < ApplicationController
  # before_action :authernticate_user!
  before_action :find_product, only: %i(show update edit)

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path, notice: 'Product successfully created'
    else
      render :new, alert: 'Product could not be created'
    end
  end

  def edit
  end

  def update
    @product.update_attributes(product_params)
    if @product.save
      redirect_to products_path, notice: 'Product successfully updated'
    else
      render :new, alert: 'Product could not be updated'
    end
  end

  private

  def product_params
    require(:product).permit(:name, :description, :price)
  end

  def find_product
    @product = Product.find(params[:id])
  end
end
