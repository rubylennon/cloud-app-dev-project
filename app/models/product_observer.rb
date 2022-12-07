class ProductObserver < ActiveRecord::Observer
  require 'logger'

  def after_create(product)
    log = Logger.new(STDOUT)
    log.info("Product ID " + product.id.to_s + " created")
  end

  def after_delete(product)
    log = Logger.new(STDOUT)
    log.info("Product ID " + product.id.to_s + " deleted")
  end

  def after_save(product)
    log = Logger.new(STDOUT)
    log.info("Product ID " + product.id.to_s + " saved")
  end

end