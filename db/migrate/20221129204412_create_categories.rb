# frozen_string_literal: true

# migration file used to create the categories database model
class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :title, null: false

      t.timestamps
    end
  end
end
