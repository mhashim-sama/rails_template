class IncreaseItemQuantity
  include Interactor

  def call
    if context.item
      context.item.update!(quantity: context.item.quantity + 1)
      context.messaage = 'Item quantity increased'
    else
      context.fail!(messaage: 'Item not found!')
    end
  end
end