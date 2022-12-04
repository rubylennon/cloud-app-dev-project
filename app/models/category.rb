class Category < ApplicationRecord
  has_many :product_categories
  has_many :products, through: :product_categories

  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }
end
