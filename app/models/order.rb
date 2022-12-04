class Order < ApplicationRecord
  has_many :items, class_name: 'OrderItem'

  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }
end
