# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

module ActiveSupport
  class TestCase
    # all the normal stuff
    parallelize(workers: :number_of_processors, with: :threads)

    fixtures :all

    include Devise::Test::IntegrationHelpers
  end
end
