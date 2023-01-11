# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :product_categories
  has_many :products, through: :product_categories

  include PublicActivity::Model
  tracked owner: proc { |controller, _model| controller.current_user }
end
