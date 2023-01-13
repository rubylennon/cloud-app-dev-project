# frozen_string_literal: true

require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order = orders(:one)
    sign_in users(:standard)
  end

  test 'should get index if user logged in' do
    get orders_url
    assert_response :success
  end

  test 'should get new if user logged in' do
    get new_order_url
    assert_response :success
  end

  test 'should create order if user logged in' do
    assert_difference('Order.count') do
      post orders_url,
           params: { order: { first_name: @order.first_name, last_name: @order.last_name,
                              sub_total: @order.sub_total } }
    end
  end

  test 'should show order if used logged in' do
    get order_url(@order)
    assert_response :success
  end

  test 'should get edit if user logged in' do
    get edit_order_url(@order)
    assert_response :success
  end

  test 'should update order if user logged in' do
    patch order_url(@order),
          params: { order: { first_name: @order.first_name, last_name: @order.last_name, sub_total: @order.sub_total } }
    assert_redirected_to order_url(@order)
  end

  test 'should destroy order if user logged in' do
    assert_difference('Order.count', -1) do
      delete order_url(@order)
    end

    assert_redirected_to orders_url
  end
end
