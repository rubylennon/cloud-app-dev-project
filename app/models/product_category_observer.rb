class ProductCategoryObserver < ActiveRecord::Observer
  require 'logger'

  def after_create(product_category)
    log = Logger.new(STDOUT)
    log.info("Product Category " + product_category.id.to_s + " created")
  end

end