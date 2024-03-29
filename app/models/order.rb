# frozen_string_literal: true

# user product order model
class Order < ApplicationRecord
  has_many :items, class_name: 'OrderItem', dependent: nil

  validates :sub_total, presence: true

  # @Ref: https://www.youtube.com/watch?v=oxdgYIHtlFc
  # Ref Description: Gem Public Activity - add an Activity Feed to your app
  if ENV['RAILS_ENV'].to_s != 'test'
    include PublicActivity::Model
    tracked owner: proc { |controller, _model| controller.current_user }
  end
end
