# frozen_string_literal: true

# observer model for the product model
class ProductObserver < ActiveRecord::Observer
  require 'logger'

  def after_create(product)
    log = Logger.new($stdout)
    log.info("Product ID #{product.id} created")
  end

  def after_destroy(product)
    log = Logger.new($stdout)
    log.info("Product ID #{product.id} deleted")
  end

  def after_save(product)
    log = Logger.new($stdout)
    log.info("Product ID #{product.id} saved")
  end
end
