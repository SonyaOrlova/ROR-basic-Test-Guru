class AddFullNameAndTypeToUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :name, :first_name
    add_column :users, :last_name, :string, null: false, default: ''
    
    add_column :users, :type, :string, null: false, default: 'User'
    add_index :users, :type
  end
end
