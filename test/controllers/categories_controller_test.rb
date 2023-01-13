# frozen_string_literal: true

require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    sign_in users(:admin)
    get categories_url
    assert_response :success
  end

  test 'should get new if user admin' do
    sign_in users(:admin)
    get new_category_url
    assert_response :redirect
  end

  test 'should not get new if user not admin' do
    sign_in users(:standard)
    get new_category_url
    assert_redirected_to root_path
  end

  test 'should create category if user admin' do
    sign_in users(:admin)
    assert_difference('Category.count') do
      post categories_url, params: { category: { title: categories(:one).title } }
    end

    assert_redirected_to category_url(Category.last)
  end

  test 'should get edit if user admin' do
    sign_in users(:admin)
    get edit_category_url(categories(:one).id)
    assert_response :success
  end

  test 'should update category if user admin' do
    sign_in users(:admin)
    patch category_url(categories(:one)), params: { category: { title: categories(:one).title } }
    assert_redirected_to category_url(categories(:one))
  end

  test 'should not destroy category if user not admin' do
    sign_in users(:standard)
    delete category_url(categories(:one))
    assert_redirected_to root_path
  end
end
