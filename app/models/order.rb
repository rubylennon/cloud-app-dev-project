# frozen_string_literal: true

class Order < ApplicationRecord
  has_many :items, class_name: 'OrderItem'

  include PublicActivity::Model
  tracked owner: proc { |controller, _model| controller.current_user }
end
