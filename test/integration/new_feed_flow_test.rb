# frozen_string_literal: true

require 'test_helper'

class NewFeedFlowTest < ActionDispatch::IntegrationTest
  def setup
    @feed = feeds(:one)
    sign_in users(:admin)
  end

  test 'new feed' do
    get feeds_path
    assert_response :success

    post feeds_path, params: { feed: { name: @feed.name, url: @feed.url,
                                       description: @feed.description } }
    assert_response :redirect
    assert_match(%r{/#{Feed.last.id}}, @response.location)
  end
end
