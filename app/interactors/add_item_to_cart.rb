class AddItemToCart
  include Interactor

  def call
    if context.product
      context.cart.cart_items.create!(
        product_id: context.product.id,
        quantity: 1
      )
      context.cart.update!(total_items: context.cart.cart_items.count)
      context.messaage = 'Product successfully added to cart'
    else
      context.fail!(messaage: 'Product not found!')
    end
  end
end