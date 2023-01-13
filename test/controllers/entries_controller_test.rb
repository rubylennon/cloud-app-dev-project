# frozen_string_literal: true

require 'test_helper'

class EntriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @entry = entries(:one)
    @feed = feeds(:one)
  end

  test 'should get index' do
    sign_in users(:admin)
    get entries_index_path, params: { 'id' => @feed.id }
    assert_response :success
  end

  test 'should get show' do
    sign_in users(:admin)
    @entries = @feed.entries.order('published desc')
    get entries_show_path, params: { 'id' => @entry.id }
    assert_response :success
  end
end
