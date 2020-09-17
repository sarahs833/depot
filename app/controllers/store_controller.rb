class StoreController < ApplicationController
  include CurrentCart
  before_action :set_cart
  before_action :set_counter, only: [:index]
  def index
    @products = Product.all.order(title: :asc)
  end
end
