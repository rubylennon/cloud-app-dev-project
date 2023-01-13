# frozen_string_literal: true

require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
  end

  test 'should get index' do
    sign_in users(:admin)
    get products_url
    assert_response :success
  end

  test 'should get new if user admin' do
    sign_in users(:admin)
    get new_product_url
    assert_response :success
  end

  test 'should not get new if user not admin' do
    sign_in users(:standard)
    assert_raises(CanCan::AccessDenied) do
      get new_product_url
    end
  end

  test 'should create product if user admin' do
    sign_in users(:admin)
    assert_difference('Product.count') do
      post products_url,
           params: { product: { net_price: @product.net_price, product_description: @product.product_description,
                                product_name: @product.product_name } }
    end

    assert_redirected_to product_url(Product.last)
  end

  test 'should not create product if user not admin' do
    sign_in users(:standard)
    assert_raises(CanCan::AccessDenied) do
      post products_url,
           params: { product: { net_price: @product.net_price, product_description: @product.product_description,
                                product_name: @product.product_name } }
    end
  end

  test 'should show product' do
    sign_in users(:admin)
    get product_url(@product)
    assert_response :success
  end

  test 'should get edit if user admin' do
    sign_in users(:admin)
    get edit_product_url(@product)
    assert_response :success
  end

  test 'should not get edit if user not admin' do
    sign_in users(:standard)
    assert_raises(CanCan::AccessDenied) do
      get edit_product_url(@product)
    end
  end

  test 'should update product if user admin' do
    sign_in users(:admin)
    patch product_url(@product),
          params: { product: { net_price: @product.net_price, product_description: @product.product_description,
                               product_name: @product.product_name } }
    assert_redirected_to product_url(@product)
  end

  test 'should not update product if user not admin' do
    sign_in users(:standard)
    assert_raises(CanCan::AccessDenied) do
      patch product_url(@product),
            params: { product: { net_price: @product.net_price, product_description: @product.product_description,
                                 product_name: @product.product_name } }
    end
  end

  test 'should not destroy product if user not admin' do
    sign_in users(:standard)
    assert_raises(CanCan::AccessDenied) do
      delete product_url(@product)
    end
  end
end
