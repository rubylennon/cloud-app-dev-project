# frozen_string_literal: true

# migration file used to add the user id column to the profiles database model
class AddUserIdToProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :user_id, :integer
  end
end
