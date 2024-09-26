class DecreaseItemQuantity
  include Interactor

  def call
    if context.item
      context.fail!(messaage: 'Cannot decrease quantity any further') if context.item.quantity <= 1
      context.item.update!(quantity: context.item.quantity - 1) if context.item.quantity > 0
      context.messaage = 'Item quantity decreased'
    else
      context.fail!(messaage: 'Item not found!')
    end
  end
end