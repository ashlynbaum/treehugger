class CreateForests < ActiveRecord::Migration
  def change
    create_table :forests do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
