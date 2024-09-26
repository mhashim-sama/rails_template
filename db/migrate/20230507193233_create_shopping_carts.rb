class CreateShoppingCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :shopping_carts, id: :uuid do |t|
      t.references :user, type: :uuid
      t.integer :total_items, default: 0

      t.timestamps
    end
  end
end
