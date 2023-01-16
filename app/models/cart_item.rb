class CartItem < ApplicationRecord

  belongs_to :items
  belongs_to :customers

  def subtotal
    item.with_tax_price * amount
  end

end
