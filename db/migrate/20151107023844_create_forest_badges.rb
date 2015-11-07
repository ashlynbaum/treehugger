class CreateForestBadges < ActiveRecord::Migration
  def change
    create_table :forest_badges do |t|
    	t.string :name
      t.references :user, index: true, foreign_key: true
      t.string :description
      t.references :forest, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
