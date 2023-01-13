# frozen_string_literal: true

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:admin)
  end

  test 'should get index if logged in' do
    get users_path
    assert_response :success
  end

  test 'should get show if logged in' do
    user = users(:admin)
    get user_path(user.id)
    assert_response :success
  end

  test 'should get edit if logged in' do
    get edit_user_path
    assert_response :success
  end
end
