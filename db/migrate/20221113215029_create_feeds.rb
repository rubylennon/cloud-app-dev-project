# frozen_string_literal: true

class CreateFeeds < ActiveRecord::Migration[7.0]
  def change
    create_table :feeds do |t|
      t.string :name
      t.string :url
      t.text :description

      t.timestamps
    end
  end
end
