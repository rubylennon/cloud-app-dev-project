# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'invalid without email' do
    user = User.new(email: '')
    assert_not user.save
  end

  test 'invalid without encrypted password' do
    user = User.new(encrypted_password: '')
    assert_not user.save
  end
end
