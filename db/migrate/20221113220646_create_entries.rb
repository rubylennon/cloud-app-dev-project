# frozen_string_literal: true

# migration file used to create the entries database model
class CreateEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :entries do |t|
      t.string :title
      t.datetime :published
      t.text :content
      t.string :url
      t.string :author
      t.integer :feed_id

      t.timestamps
    end
  end
end
