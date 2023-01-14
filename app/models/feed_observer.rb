# frozen_string_literal: true

# observer model for the feed model
class FeedObserver < ActiveRecord::Observer
  require 'logger'

  def after_create(feed)
    log = Logger.new($stdout)
    log.info("Feed ID #{feed.id} created")
  end

  def after_save(feed)
    log = Logger.new($stdout)
    log.info("Feed ID #{feed.id} saved")
  end

  def after_destroy(feed)
    log = Logger.new($stdout)
    log.info("Feed ID #{feed.id} deleted")
  end
end
