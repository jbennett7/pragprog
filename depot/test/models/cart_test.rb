require 'test_helper'

class CartTest < ActiveSupport::TestCase
  def add_a_product(cart, product_name)
    cart.add_product(products(product_name).id, products(product_name).price)
    cart
  end

  test "add two different products" do
    cart = Cart.create
    cart = add_a_product(cart,:one)
    cart = add_a_product(cart,:two)
    cart.save
    compare_price = products(:one).price + products(:two).price
    assert_equal 2, cart.line_items.count
    assert_equal compare_price, cart.total_price
  end

  test "add duplicate products" do
    cart = Cart.create
    cart = add_a_product(cart,:one)
    cart = add_a_product(cart,:one)
    cart.save
    assert_equal 2, cart.line_items.count
    assert_equal 2*products(:one).price, cart.total_price
  end
end
