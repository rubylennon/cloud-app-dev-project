# frozen_string_literal: true

# order item model
class OrderItem < ApplicationRecord
  belongs_to :order, dependent: nil
  belongs_to :product, dependent: nil
end
