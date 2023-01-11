# frozen_string_literal: true

class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :screenname
      t.string :city

      t.timestamps
    end
  end
end
