# frozen_string_literal: true

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test 'valid product' do
    product = Product.new(product_name: products(:one).product_name,
                          product_description: products(:one).product_description,
                          net_price: products(:one).net_price, image_filename: products(:one).image_filename)
    assert product.save
  end
end
