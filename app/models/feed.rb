# frozen_string_literal: true

class Feed < ActiveRecord::Base
  has_many :entries, dependent: :destroy

  include PublicActivity::Model
  tracked owner: proc { |controller, _model| controller.current_user }
end
