# frozen_string_literal: true

# observer model for the feed model
class ProfileObserver < ActiveRecord::Observer
  require 'logger'

  def after_create(profile)
    log = Logger.new($stdout)
    log.info("profile ID #{profile.id} created")
  end

  def after_save(profile)
    log = Logger.new($stdout)
    log.info("profile ID #{profile.id} saved")
  end

  def after_destroy(profile)
    log = Logger.new($stdout)
    log.info("profile ID #{profile.id} deleted")
  end
end
