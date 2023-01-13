# frozen_string_literal: true

require 'test_helper'

class ProfileTest < ActiveSupport::TestCase
  test 'valid profile' do
    profile = Profile.new(screenname: profiles(:one).screenname, city: profiles(:one).city,
                          user_id: profiles(:one).user_id)
    assert profile.save
  end
end
