# frozen_string_literal: true

require 'test_helper'

class ProductCategoryTest < ActiveSupport::TestCase
  test 'valid product category' do
    product_category = ProductCategory.new(product_id: product_categories(:one).product_id,
                                           category_id: product_categories(:one).category_id)
    assert product_category.save
  end

  test 'invalid without product_id' do
    product_category = ProductCategory.new(category_id: product_categories(:one).category_id)
    assert_not product_category.save
  end

  test 'invalid without category_id' do
    product_category = ProductCategory.new(product_id: product_categories(:one).product_id)
    assert_not product_category.save
  end
end
