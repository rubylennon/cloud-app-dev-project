# frozen_string_literal: true

# migration file used to remove the null constraint from the name columns in
# the orders model
class RemoveNullConstraint < ActiveRecord::Migration[7.0]
  def change
    change_column_null :orders, :first_name, true
    change_column_null :orders, :last_name, true
  end
end
