class StoreController < ApplicationController
  def index
    @products = Product.order(:title)
    @date_time = Time.now
  end
end
