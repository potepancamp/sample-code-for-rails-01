class ChangeDataStartAtAndEndAtToPosts < ActiveRecord::Migration[6.1]
  def change
    change_column :posts, :start_at, :date
    change_column :posts, :end_at, :date
  end
end
