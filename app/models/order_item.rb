# frozen_string_literal: true

# order item model
class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product
end
