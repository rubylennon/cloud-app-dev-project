# frozen_string_literal: true

json.extract! product_category, :id, :created_at, :updated_at
json.url product_category_url(product_category, format: :json)
