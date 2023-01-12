# frozen_string_literal: true

# user profile order model
class Profile < ApplicationRecord
  belongs_to :user
  validates :screenname, presence: true
  validates :city, presence: true

  include PublicActivity::Model
  tracked owner: proc { |controller, _model| controller.current_user }
end
