# frozen_string_literal: true

# product category model
class ProductCategory < ApplicationRecord
  belongs_to :product, dependent: nil
  belongs_to :category, dependent: nil

  if ENV['RAILS_ENV'].to_s != 'test'
    include PublicActivity::Model
    tracked owner: proc { |controller, _model| controller.current_user }
  end
end
