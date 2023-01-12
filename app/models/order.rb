# frozen_string_literal: true

# user product order model
class Order < ApplicationRecord
  has_many :items, class_name: 'OrderItem'

  include PublicActivity::Model
  tracked owner: proc { |controller, _model| controller.current_user }
end
