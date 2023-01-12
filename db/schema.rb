# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_221_228_140_954) do
  create_table 'activities', force: :cascade do |t|
    t.string 'trackable_type'
    t.integer 'trackable_id'
    t.string 'owner_type'
    t.integer 'owner_id'
    t.string 'key'
    t.text 'parameters'
    t.string 'recipient_type'
    t.integer 'recipient_id'
    t.datetime 'created_at', precision: nil, null: false
    t.datetime 'updated_at', precision: nil, null: false
    t.index %w[owner_id owner_type], name: 'index_activities_on_owner_id_and_owner_type'
    t.index %w[owner_type owner_id], name: 'index_activities_on_owner_type_and_owner_id'
    t.index %w[recipient_id recipient_type], name: 'index_activities_on_recipient_id_and_recipient_type'
    t.index %w[recipient_type recipient_id], name: 'index_activities_on_recipient_type_and_recipient_id'
    t.index %w[trackable_id trackable_type], name: 'index_activities_on_trackable_id_and_trackable_type'
    t.index %w[trackable_type trackable_id], name: 'index_activities_on_trackable_type_and_trackable_id'
  end

  create_table 'categories', force: :cascade do |t|
    t.string 'title', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'entries', force: :cascade do |t|
    t.string 'title'
    t.datetime 'published'
    t.text 'content'
    t.string 'url'
    t.string 'author'
    t.integer 'feed_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'description'
    t.string 'image'
  end

  create_table 'feeds', force: :cascade do |t|
    t.string 'name'
    t.string 'url'
    t.text 'description'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'order_items', force: :cascade do |t|
    t.integer 'quantity', default: 0, null: false
    t.decimal 'price', precision: 15, scale: 2, null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'order_id', null: false
    t.integer 'product_id', null: false
    t.index ['order_id'], name: 'index_order_items_on_order_id'
    t.index ['product_id'], name: 'index_order_items_on_product_id'
  end

  create_table 'orders', force: :cascade do |t|
    t.string 'first_name'
    t.string 'last_name'
    t.decimal 'sub_total', precision: 15, scale: 2, null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'token'
    t.string 'status', default: 'cart'
    t.decimal 'total'
    t.integer 'user_id'
  end

  create_table 'product_categories', force: :cascade do |t|
    t.integer 'product_id', null: false
    t.integer 'category_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['category_id'], name: 'index_product_categories_on_category_id'
    t.index ['product_id'], name: 'index_product_categories_on_product_id'
  end

  create_table 'products', force: :cascade do |t|
    t.string 'product_name'
    t.text 'product_description'
    t.decimal 'net_price'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'image_filename', default: 'placeholder.png'
    t.boolean 'category_required', default: true
  end

  create_table 'profiles', force: :cascade do |t|
    t.string 'screenname'
    t.string 'city'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'user_id'
  end

  add_foreign_key 'order_items', 'orders'
  add_foreign_key 'order_items', 'products'
  add_foreign_key 'product_categories', 'categories'
  add_foreign_key 'product_categories', 'products'
end
