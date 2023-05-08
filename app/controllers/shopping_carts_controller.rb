class ShoppingCartsController < ApplicationController
  before_action :find_cart

  def items
    @items = @cart.cart_items.includes(:product)
  end

  def add_items
    @product = Product.find(params[:product_id])
    context = {
      product: @product,
      cart: @cart
    }
    result = AddItemToCart.call(context)
    if result.success?
      redirect_to @product, notice: result.messaage
    else
      redirect_to @product, alert: result.messaage
    end
  end

  def remove_items
    @item = CartItem.find(params[:item_id])
    context = {
      item: @item,
      cart: @cart
    }
    result = RemoveItemFromCart.call(context)
    if result.success?
      redirect_to @cart, notice: result.messaage
    else
      redirect_to @cart, alert: result.messaage
    end
  end

  private

  def find_cart
    @cart = current_user.shopping_cart
  end
end
