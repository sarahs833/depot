class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  def total_price
    quantity * product.price
  end

  def check_quantity
    if self.quantity > 1
      self.update(quantity: self.quantity - 1)
    else
      self.destroy
    end
  end
end
