# frozen_string_literal: true

# product category model
class ProductCategory < ApplicationRecord
  belongs_to :product, dependent: nil
  belongs_to :category, dependent: nil

  include PublicActivity::Model
  tracked owner: proc { |controller, _model| controller.current_user }
end
