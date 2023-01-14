# frozen_string_literal: true

# feed model
class Feed < ApplicationRecord
  has_many :entries, dependent: :destroy

  # @Ref: https://www.youtube.com/watch?v=oxdgYIHtlFc
  # Ref Description: Gem Public Activity - add an Activity Feed to your app
  include PublicActivity::Model
  tracked owner: proc { |controller, _model| controller.current_user }
end
