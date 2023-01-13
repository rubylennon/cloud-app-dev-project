# frozen_string_literal: true

# product model
class Product < ApplicationRecord
  validates :product_name, presence: true
  validates :product_description, presence: true
  validates :net_price, presence: true

  has_many :product_categories, dependent: nil
  has_many :categories, through: :product_categories

  if ENV['RAILS_ENV'].to_s != 'test'
    include PublicActivity::Model
    tracked owner: proc { |controller, _model| controller.current_user }
  end
end
