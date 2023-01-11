# frozen_string_literal: true

class ProductCategory < ApplicationRecord
  belongs_to :product
  belongs_to :category

  include PublicActivity::Model
  tracked owner: proc { |controller, _model| controller.current_user }
end
