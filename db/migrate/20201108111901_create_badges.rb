class CreateBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :badges do |t|
      t.string :title, null: false, unique: true
      t.string :icon_url, null: false
      t.string :rule_type, null: false
      t.string :rule_value
      t.references :test_passage, foreign_key: true

      t.timestamps
    end
  end
end
