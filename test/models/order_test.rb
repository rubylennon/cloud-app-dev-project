# frozen_string_literal: true

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test 'valid order' do
    order = Order.new(first_name: orders(:one).first_name, last_name: orders(:one).last_name,
                      sub_total: orders(:one).sub_total, token: orders(:one).token,
                      status: orders(:one).status, total: orders(:one).total,
                      user_id: orders(:one).user_id)
    assert order.save
  end

  test 'invalid without sub_total' do
    order = Order.new(first_name: orders(:one).first_name, last_name: orders(:one).last_name,
                      sub_total: '', token: orders(:one).token,
                      status: orders(:one).status, total: orders(:one).total,
                      user_id: orders(:one).user_id)
    assert_not order.save
  end
end
