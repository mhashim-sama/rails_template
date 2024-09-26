class CreateCartItems < ActiveRecord::Migration[7.0]
  def change
    create_table :cart_items, id: :uuid do |t|
      t.references :shopping_cart, type: :uuid
      t.references :product, type: :uuid
      t.integer :quantity

      t.timestamps
    end
  end
end
