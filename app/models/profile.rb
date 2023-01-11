# frozen_string_literal: true

class Profile < ApplicationRecord
  belongs_to :user
  validates :screenname, presence: true
  validates :city, presence: true
  validates :user_id, presence: true

  include PublicActivity::Model
  tracked owner: proc { |controller, _model| controller.current_user }
end
