class Product < ApplicationRecord
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }

  validates :product_name, presence: true

  has_many :product_categories
  has_many :categories, through: :product_categories

end
