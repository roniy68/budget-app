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

ActiveRecord::Schema[7.0].define(version: 20_230_603_124_601) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'categories', force: :cascade do |t|
    t.text 'name'
    t.text 'icon'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'user_id'
    t.index ['user_id'], name: 'index_categories_on_user_id'
  end

  create_table 'spend_items', force: :cascade do |t|
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'category_id'
    t.bigint 'spending_id'
    t.index ['category_id'], name: 'index_spend_items_on_category_id'
    t.index ['spending_id'], name: 'index_spend_items_on_spending_id'
  end

  create_table 'spendings', force: :cascade do |t|
    t.text 'name'
    t.decimal 'amount'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'author_id'
    t.index ['author_id'], name: 'index_spendings_on_author_id'
  end

  create_table 'users', force: :cascade do |t|
    t.text 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'categories', 'users'
  add_foreign_key 'spend_items', 'categories'
  add_foreign_key 'spend_items', 'spendings'
  add_foreign_key 'spendings', 'users', column: 'author_id'
end
