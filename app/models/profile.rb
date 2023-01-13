# frozen_string_literal: true

# user profile order model
class Profile < ApplicationRecord
  belongs_to :user, dependent: nil
  validates :screenname, presence: true
  validates :city, presence: true

  if ENV['RAILS_ENV'].to_s != 'test'
    include PublicActivity::Model
    tracked owner: proc { |controller, _model| controller.current_user }
  end
end
