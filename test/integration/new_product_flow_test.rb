# frozen_string_literal: true

require 'test_helper'

class NewProductFlowTest < ActionDispatch::IntegrationTest
  test 'new product' do
    @product = products(:one)
    sign_in users(:admin)

    get products_path
    assert_response :success

    post products_path, params: { product: { product_name: @product.product_name,
                                             product_description: @product.product_description,
                                             net_price: @product.net_price } }
    assert_response :redirect
    assert_match(%r{/#{Product.last.id}}, @response.location)
  end
end
