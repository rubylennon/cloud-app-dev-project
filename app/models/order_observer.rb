# frozen_string_literal: true

# observer model for the order model
class OrderObserver < ActiveRecord::Observer
  require 'logger'

  def after_create(order)
    log = Logger.new($stdout)
    log.info("order ID #{order.id} created")
  end

  def after_save(order)
    log = Logger.new($stdout)
    log.info("order ID #{order.id} saved")
  end
end
