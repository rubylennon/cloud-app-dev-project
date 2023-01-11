# frozen_string_literal: true

class Product < ApplicationRecord
  include PublicActivity::Model
  tracked owner: proc { |controller, _model| controller.current_user }

  validates :product_name, presence: true
  validates :product_description, presence: true
  validates :net_price, presence: true

  has_many :product_categories
  has_many :categories, through: :product_categories
end
