# frozen_string_literal: true

require 'test_helper'

class OrderItemTest < ActiveSupport::TestCase
  test 'valid order item' do
    order_item = OrderItem.new(quantity: order_items(:one).quantity, price: order_items(:one).price,
                               order_id: order_items(:one).order_id, product_id: order_items(:one).product_id)
    assert order_item.save
  end

  test 'invalid without quantity' do
    order_item = OrderItem.new(quantity: "", price: order_items(:one).price,
                               order_id: order_items(:one).order_id, product_id: order_items(:one).product_id)
    assert_not order_item.save
  end

  test 'invalid without price' do
    order_item = OrderItem.new(quantity: order_items(:one).quantity,
                               order_id: order_items(:one).order_id, product_id: order_items(:one).product_id)
    assert_not order_item.save
  end
end