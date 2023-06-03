class AddUserRefToCategory < ActiveRecord::Migration[7.0]
  def change
    add_reference :categories, :user_ref, null: false, foreign_key: { to_table: :users }
  end
end