class DropJoinTableUserTest < ActiveRecord::Migration[6.0]
  def change
    drop_join_table :users, :tests
  end
end
