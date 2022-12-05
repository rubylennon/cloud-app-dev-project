class ProductCategory < ApplicationRecord
  belongs_to :product
  belongs_to :category

  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }
end
