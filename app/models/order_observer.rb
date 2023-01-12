# frozen_string_literal: true

# observer model for the order model
class OrderObserver < ActiveRecord::Observer
  require 'logger'

  def after_create(_order)
    log = Logger.new($stdout)
    log.info('New order record created')
  end

  def after_save(order)
    log = Logger.new($stdout)
    log.info("Order ID #{order.id} saved")
    # order.total = (order.sub_total * 0.23) + order.sub_total
    # order.save
  end
end
