# frozen_string_literal: true

class ShoppingCart
  delegate :sub_total, :total, to: :order

  def initialize(token, cart_user)
    @token = token
    @cart_user = cart_user
  end

  def order
    @order ||= Order.find_or_create_by(token: @token, status: 'cart') do |order|
      order.sub_total = 0
      order.total = 0
    end
  end

  def items_count
    order.items.sum(:quantity)
  end

  def add_item(product_id:, quantity: 1)
    product = Product.find(product_id)

    order_item = order.items.find_or_initialize_by(
      product_id:
    )

    order_item.price = product.net_price
    order_item.quantity = quantity

    ActiveRecord::Base.transaction do
      order_item.save
      update_sub_total!
    end
  end

  def remove_item(id:)
    ActiveRecord::Base.transaction do
      order.items.destroy(id)
      update_sub_total!
    end
  end

  private

  def update_sub_total!
    order.sub_total = order.items.sum('quantity * price')
    order.save
    update_total!
  end

  def update_total!
    order.total = (order.sub_total * 0.23) + order.sub_total
    order.save
    update_user!
  end

  def update_user!
    order.user_id = @cart_user
    order.save
  end
end
