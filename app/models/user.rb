# frozen_string_literal: true

# @Ref 1 - https://www.youtube.com/watch?v=7v2EMmfBJL8
# Ref Description - devise user tutorial
# @Ref 2 - https://www.youtube.com/watch?v=7Rs6CT9G5AM
# Ref Description: Devise Trackable tutorial
# user model
class User < ApplicationRecord
  validates :email, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  has_one :profile, dependent: :destroy

  validates :email, presence: true

  # @Ref: https://www.youtube.com/watch?v=oxdgYIHtlFc
  # Ref Description: Gem Public Activity - add an Activity Feed to your app
  if ENV['RAILS_ENV'].to_s != 'test'
    include PublicActivity::Model
    tracked owner: proc { |controller, _model| controller.current_user }
  end
end
