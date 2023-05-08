class RemoveItemFromCart
  include Interactor

  def call
    if context.item
      context.item.destroy!
      context.messaage = 'Item successfully removed from cart'
    else
      context.fail!(messaage: 'item not found!')
    end
  end
end