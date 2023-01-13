# frozen_string_literal: true

require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    sign_in users(:admin)
    get root_path
    assert_response :success
  end

  test 'should get about' do
    sign_in users(:admin)
    get home_about_path
    assert_response :success
  end
end
