class CreateFeedbacks < ActiveRecord::Migration[6.0]
  def change
    create_table :feedbacks do |t|
      t.string :body, null: false

      t.references :user, foreign_key: true, null: false
      
      t.timestamps
    end
  end
end
