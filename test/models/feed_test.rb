# frozen_string_literal: true

require 'test_helper'

class FeedTest < ActiveSupport::TestCase
  test 'valid feed' do
    feed = Feed.new(name: feeds(:one).name, url: feeds(:one).url, description: feeds(:one).description)
    assert feed.save
  end
end
