# frozen_string_literal: true

# feed model
class Feed < ApplicationRecord
  has_many :entries, dependent: :destroy

  include PublicActivity::Model
  tracked owner: proc { |controller, _model| controller.current_user }
end
