class Profile < ApplicationRecord
  belongs_to :user
  validates :screenname, presence: true
  validates :city, presence: true
  validates :user_id, presence: true

  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }
end
