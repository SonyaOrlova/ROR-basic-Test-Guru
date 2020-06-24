class RemoveTestAuthorIdDefault < ActiveRecord::Migration[6.0]
  def change
    change_column_default :tests, :author_id, nil
  end
end
