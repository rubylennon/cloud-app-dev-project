# frozen_string_literal: true

# observer model for the product category model
class ProductCategoryObserver < ActiveRecord::Observer
  require 'logger'

  def after_create(product_category)
    log = Logger.new($stdout)
    log.info("Product Category #{product_category.id} created")
  end
end
