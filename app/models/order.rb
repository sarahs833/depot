class Order < ApplicationRecord

  enum pay_type: {
  "Check" => 0,
  "Credit card" => 1,
  "Purchase order" => 2
  }
  has_many :line_items, dependent: :destroy
  validates :name, :address , :email , presence: true
  validates :pay_type, inclusion: pay_types.keys


  def add_line_items_from_cart(cart)
    cart.line_items.each do |line|
      line.cart_id = nil
      self.line_items << line
    end
  end


end
