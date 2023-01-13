# frozen_string_literal: true

require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = categories(:one)
  end

  test 'should get index' do
    sign_in users(:admin)
    get categories_url
    assert_response :success
  end

  test 'should get new if user admin' do
    sign_in users(:admin)
    get new_category_url
    assert_response :success
  end

  test 'should not get new if user not admin' do
    sign_in users(:standard)
    assert_raises(CanCan::AccessDenied) do
      get new_category_url
    end
  end

  test 'should create category if user admin' do
    sign_in users(:admin)
    assert_difference('Category.count') do
      post categories_url, params: { category: { title: @category.title } }
    end

    assert_redirected_to category_url(Category.last)
  end

  test 'should not create category if user not admin' do
    sign_in users(:standard)
    assert_raises(CanCan::AccessDenied) do
      post categories_url, params: { category: { title: @category.title } }
    end
  end

  test 'should get edit if user admin' do
    sign_in users(:admin)
    get edit_category_url(@category)
    assert_response :success
  end

  test 'should not get edit if user not admin' do
    sign_in users(:standard)
    assert_raises(CanCan::AccessDenied) do
      get edit_category_url(@category)
    end
  end

  test 'should update category if user admin' do
    sign_in users(:admin)
    patch category_url(@category), params: { category: { title: @category.title } }
    assert_redirected_to category_url(@category)
  end

  test 'should not update category if user not admin' do
    sign_in users(:standard)
    assert_raises(CanCan::AccessDenied) do
      patch category_url(@category), params: { category: { title: @category.title } }
    end
  end
end
