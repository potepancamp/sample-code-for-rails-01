class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.datetime :start_at, null: false
      t.datetime :end_at, null: false
      t.boolean :is_all_day, null: false, default: false
      t.text :memo

      t.timestamps
    end
  end
end