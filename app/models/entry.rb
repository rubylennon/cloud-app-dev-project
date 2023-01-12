# frozen_string_literal: true

# entry model
class Entry < ActiveRecord::Base
  belongs_to :feed
end
