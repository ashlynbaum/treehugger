class CreateTrees < ActiveRecord::Migration
  def change
    create_table :trees do |t|
      t.string :name
      t.text :description
      t.string :images

      t.timestamps null: false
    end
  end
end
