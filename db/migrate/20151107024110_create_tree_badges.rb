class CreateTreeBadges < ActiveRecord::Migration
  def change
    create_table :tree_badges do |t|
      t.string :image
      t.string :name
      t.references :user, index: true, foreign_key: true
      t.string :description
      t.references :tree, index: true, foreign_key: true
      t.string :coordinate

      t.timestamps null: false
    end
  end
end
