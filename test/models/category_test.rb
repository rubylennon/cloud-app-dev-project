# frozen_string_literal: true

require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test 'valid category' do
    category = Category.new(title: categories(:one).title)
    assert category.save
  end

  test 'invalid without title' do
    category = Category.new
    assert_not category.save
  end
end
