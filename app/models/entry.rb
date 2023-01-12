# frozen_string_literal: true

# entry model
class Entry < ApplicationRecord
  belongs_to :feed, dependent: nil
end
