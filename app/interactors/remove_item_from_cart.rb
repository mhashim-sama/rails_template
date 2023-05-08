class RemoveItemFromCart
  include Interactor

  def call
    if context.item
      context.item.destroy!
      context.cart.update(total_items: context.cart.cart_items.count)
      context.messaage = 'Item successfully removed from cart'
    else
      context.fail!(messaage: 'item not found!')
    end
  end
end