class ShoppingCart < ActiveRecord::Base
  has_many :shopping_cart_products
end
