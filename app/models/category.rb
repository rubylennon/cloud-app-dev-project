# frozen_string_literal: true

# category model
class Category < ApplicationRecord
  has_many :product_categories, dependent: nil
  has_many :products, through: :product_categories

  validates :title, presence: true

  if ENV['RAILS_ENV'].to_s != 'test'
    include PublicActivity::Model
    tracked owner: proc { |controller, _model| controller.current_user }
  end
end
