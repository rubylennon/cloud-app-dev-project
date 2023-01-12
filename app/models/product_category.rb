# frozen_string_literal: true

# product category model
class ProductCategory < ApplicationRecord
  belongs_to :product
  belongs_to :category

  include PublicActivity::Model
  tracked owner: proc { |controller, _model| controller.current_user }
end
