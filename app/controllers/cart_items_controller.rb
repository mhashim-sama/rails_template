class CartItemsController < ApplicationController
  def increment_quantity
    @item = CartItem.find(params[:item_id])
    context = { item: @item }
    result = IncreaseItemQuantity.call(context)
    if result.success?
      redirect_to shopping_cart_items_path, notice: result.messaage
    else
      redirect_to shopping_cart_items_path, alert: result.messaage
    end
  end

  def decrement_quantity
    @item = CartItem.find(params[:item_id])
    context = { item: @item }
    result = DecreaseItemQuantity.call(context)
    if result.success?
      redirect_to shopping_cart_items_path, notice: result.messaage
    else
      redirect_to shopping_cart_items_path, alert: result.messaage
    end
  end
end
