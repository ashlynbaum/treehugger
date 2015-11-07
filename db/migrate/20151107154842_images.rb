class Images < ActiveRecord::Migration
  def change
  	create_table :images do |t|
  	  t.string :source
  	  t.references :user, index: true, foreign_key: true
  	  t.references :tree, index: true, foreign_key: true
  	  t.boolean :thumbnail
  	  t.timestamps null: false
  	end
  end
end
