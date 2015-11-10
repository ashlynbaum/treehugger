class Images < ActiveRecord::Migration
  def change
  	create_table :images do |t|
  	  t.string :source
  	  t.references :user
  	  t.references :tree
  	  t.boolean :thumbnail
  	  t.timestamps null: false
  	end
  end
end
