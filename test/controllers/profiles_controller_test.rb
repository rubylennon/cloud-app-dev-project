# frozen_string_literal: true

require 'test_helper'

class ProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @profile = profiles(:one)
  end

  test 'should get index if logged in' do
    sign_in users(:standard)
    get profiles_url
    assert_response :success
  end

  test 'should get new if logged in' do
    sign_in users(:standard)
    get new_profile_url
    assert_response :success
  end

  test 'should show profile if logged in' do
    sign_in users(:standard)
    get profile_url(@profile)
    assert_response :success
  end

  test 'should get edit if logged in' do
    sign_in users(:standard)
    get edit_profile_url(@profile)
    assert_response :success
  end

  test 'should update profile if logged in' do
    sign_in users(:standard)
    patch profile_url(@profile), params: { profile: { city: @profile.city, screenname: @profile.screenname } }
    assert_redirected_to profile_url(@profile)
  end

  test 'should destroy profile if logged in' do
    sign_in users(:standard)
    assert_difference('Profile.count', -1) do
      delete profile_url(@profile)
    end

    assert_redirected_to profiles_url
  end
end
