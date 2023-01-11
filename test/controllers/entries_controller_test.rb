# frozen_string_literal: true

require 'test_helper'

class EntriesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get entries_index_path
    assert_response :success
  end

  test 'should get show' do
    get entries_show_path
    assert_response :success
  end
end
