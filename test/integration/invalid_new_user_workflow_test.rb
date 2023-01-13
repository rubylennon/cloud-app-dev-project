# frozen_string_literal: true

require 'test_helper'

class InvalidNewUserWorkflowTest < ActionDispatch::IntegrationTest
  test 'try to create new user without email address' do
    @user = users(:one)
    get '/users/sign_up'
    assert_response :success

    post users_path, params: { user: { last_name: @user.last_name } }
    assert_equal '/users', path
    assert_select 'li', "Email can't be blank"
    assert_select 'li', "Password can't be blank"
  end
end
