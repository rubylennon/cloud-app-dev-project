# frozen_string_literal: true

# @Ref - https://www.youtube.com/watch?v=5OTgURghwdU
# Ref Description - user profiles tutorial
# user profile order model
class Profile < ApplicationRecord
  belongs_to :user, dependent: nil
  validates :screenname, presence: true
  validates :city, presence: true

  # @Ref: https://www.youtube.com/watch?v=oxdgYIHtlFc
  # Ref Description: Gem Public Activity - add an Activity Feed to your app
  include PublicActivity::Model
  tracked owner: proc { |controller, _model| controller.current_user }
end
