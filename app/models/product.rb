# frozen_string_literal: true

# product model
class Product < ApplicationRecord
  validates :product_name, presence: true
  validates :product_description, presence: true
  validates :net_price, presence: true

  # @Ref: https://www.youtube.com/watch?v=oxdgYIHtlFc
  # Ref Description: Gem Public Activity - add an Activity Feed to your app
  include PublicActivity::Model
  tracked owner: proc { |controller, _model| controller.current_user }
end
