# frozen_string_literal: true

require 'test_helper'

class FeedsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @feed = feeds(:one)
  end

  test 'should get index' do
    get feeds_url
    assert_response :success
  end

  test 'should get new if logged in user is admin' do
    sign_in users(:admin)
    get new_feed_url
    assert_response :success
  end

  test 'should not get new if logged in user is not admin' do
    sign_in users(:standard)
    assert_raises(CanCan::AccessDenied) do
      get new_feed_url
    end
  end

  test 'should create feed if user is admin' do
    sign_in users(:admin)
    assert_difference('Feed.count') do
      post feeds_url, params: { feed: { description: @feed.description, name: @feed.name, url: @feed.url } }
    end

    assert_redirected_to feed_url(Feed.last)
  end

  test 'should not create feed if user is not admin' do
    sign_in users(:standard)
    assert_raises(CanCan::AccessDenied) do
      post feeds_url, params: { feed: { description: @feed.description, name: @feed.name, url: @feed.url } }
    end
  end


  test 'should show feed' do
    get feed_url(@feed)
    assert_response :success
  end

  test 'should get edit if user admin' do
    sign_in users(:admin)
    get edit_feed_url(@feed)
    assert_response :success
  end

  test 'should not get edit if user not admin' do
    sign_in users(:standard)
    assert_raises(CanCan::AccessDenied) do
      get edit_feed_url(@feed)
    end
  end

  test 'should update feed if user admin' do
    sign_in users(:admin)
    patch feed_url(@feed), params: { feed: { description: @feed.description, name: @feed.name, url: @feed.url } }
    assert_redirected_to feed_url(@feed)
  end

  test 'should not update feed if user not admin' do
    sign_in users(:standard)
    assert_raises(CanCan::AccessDenied) do
      get edit_feed_url(@feed)
      patch feed_url(@feed), params: { feed: { description: @feed.description, name: @feed.name, url: @feed.url } }
    end
  end

  test 'should destroy feed if user admin' do
    sign_in users(:admin)
    assert_difference('Feed.count', -1) do
      delete feed_url(@feed)
    end

    assert_redirected_to feeds_url
  end

  test 'should not destroy feed if user not admin' do
    sign_in users(:standard)
    assert_raises(CanCan::AccessDenied) do
      delete feed_url(@feed)
    end
  end
end
