# frozen_string_literal: true

require 'test_helper'

class ProductCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product_category = product_categories(:one)
  end

  test 'should get index if user admin' do
    sign_in users(:admin)
    get product_categories_url
    assert_response :success
  end

  test 'should not get index if user not admin' do
    sign_in users(:standard)
    get product_categories_url
    assert_redirected_to root_path
  end

  test 'should get new if user admin' do
    sign_in users(:admin)
    get new_product_category_url
    assert_response :success
  end

  test 'should not get new if user not admin' do
    sign_in users(:standard)
    get new_product_category_url
    assert_redirected_to root_path
  end

  test 'should create product_category if user admin' do
    sign_in users(:admin)
    assert_difference('ProductCategory.count') do
      post product_categories_url,
           params: { product_category: { category_id: @product_category.category_id,
                                         product_id: @product_category.product_id } }
    end

    assert_redirected_to product_category_url(ProductCategory.last)
  end

  test 'should not create product_category if user not admin' do
    sign_in users(:standard)
    post product_categories_url,
         params: { product_category: { category_id: @product_category.category_id,
                                       product_id: @product_category.product_id } }
    assert_redirected_to root_path
  end

  test 'should show product_category if user admin' do
    sign_in users(:admin)
    get product_category_url(@product_category)
    assert_response :success
  end

  test 'should not show product_category if user not admin' do
    sign_in users(:standard)
    get product_category_url(@product_category)
    assert_redirected_to root_path
  end

  test 'should not get edit if user not logged in' do
    sign_out users(:standard)
    get edit_product_category_url(@product_category)
    assert_response :redirect
  end

  test 'should not get edit if user not admin' do
    sign_in users(:standard)
    get edit_product_category_url(@product_category)
    assert_redirected_to root_path
  end

  test 'should update product_category if user admin' do
    sign_in users(:admin)
    patch product_category_url(@product_category),
          params: { product_category: { category_id: @product_category.category_id,
                                        product_id: @product_category.product_id } }
    assert_redirected_to product_category_url(@product_category)
  end

  test 'should not update product_category if user not admin' do
    sign_in users(:standard)
    patch product_category_url(@product_category),
          params: { product_category: { category_id: @product_category.category_id,
                                        product_id: @product_category.product_id } }
    assert_redirected_to root_path
  end

  test 'should destroy product_category if user admin' do
    sign_in users(:admin)
    assert_difference('ProductCategory.count', -1) do
      delete product_category_url(@product_category)
    end

    assert_redirected_to product_categories_url
  end

  test 'should not destroy product_category if user not admin' do
    sign_in users(:standard)
    delete product_category_url(@product_category)
    assert_redirected_to root_path
  end
end
