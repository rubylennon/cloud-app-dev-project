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
end
