class CombineItemsInCart < ActiveRecord::Migration[6.0]
  def change
    def up
      Cart.all.each do |cart|
# count the num ber of each prod uct in the cart
      sums = cart.line_items.group(:product_id ).sum(:quantity)
        sums.each do |product_id, quantity|
          if quantity > 1
      # re move in di vid ual items
            cart.line_items.where(product_id: product_id).delete_all
        # re place with a sin gle item
            item = cart.line_items.build(product_id: product_id)
            item.quantity = quantity
            item.save!
          end
        end
      end
    end
    def down
# split items with quan tity>1 into mul ti ple items
      LineItem.where("quantity>1").each do |line_item|
      # add in di vid ual items
      line_item.quantity.times do
        LineItem.create(
        cart_id: line_item.cart_id ,
        product_id: line_item.product_id ,
        quantity: 1
        )
      end
      # re move orig i nal item
        line_item.destroy
      end
    end
  end
end