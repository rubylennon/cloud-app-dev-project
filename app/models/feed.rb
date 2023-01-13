# frozen_string_literal: true

# feed model
class Feed < ApplicationRecord
  has_many :entries, dependent: :destroy

  if ENV['RAILS_ENV'].to_s != 'test'
    include PublicActivity::Model
    tracked owner: proc { |controller, _model| controller.current_user }
  end
end
