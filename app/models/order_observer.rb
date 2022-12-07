class OrderObserver < ActiveRecord::Observer
  require 'logger'

  def after_create(order)
    log = Logger.new(STDOUT)
    log.info("New order record created")
  end

  def after_save(order)
    log = Logger.new(STDOUT)
    log.info("Order ID " + order.id.to_s + " saved")
    # order.total = (order.sub_total * 0.23) + order.sub_total
    # order.save
  end

end