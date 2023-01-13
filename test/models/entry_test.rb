# frozen_string_literal: true

require 'test_helper'

class EntryTest < ActiveSupport::TestCase
  test 'valid entry' do
    entry = Entry.new(title: entries(:one).title, published: entries(:one).published,
                      content: entries(:one).content, url: entries(:one).url,
                      author: entries(:one).author, feed_id: entries(:one).feed_id,
                      description: entries(:one).description)
    assert entry.save
  end
end
