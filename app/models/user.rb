class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :shopping_cart
  after_create :create_shopping_cart

  private

  def create_shopping_cart
    ShoppingCart.create(user_id: self.id)
  end
end
