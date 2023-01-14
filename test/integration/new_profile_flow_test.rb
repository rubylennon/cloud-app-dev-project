# frozen_string_literal: true

require 'test_helper'

class NewProfileFlowTest < ActionDispatch::IntegrationTest
  test 'new profile' do
    @profile = profiles(:one)
    sign_in users(:admin)

    get profiles_path
    assert_response :success

    post profiles_path, params: { profile: { screenname: @profile.screenname,
                                             city: @profile.city } }
    assert_response :redirect
    assert_match(%r{/#{Profile.last.id}}, @response.location)
  end
end
