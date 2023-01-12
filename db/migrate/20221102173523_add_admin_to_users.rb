# frozen_string_literal: true

# migration file used to create the user admin boolean column to the users model
class AddAdminToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :admin, :boolean, default: false
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
  end
end
