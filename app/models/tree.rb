class Tree < ActiveRecord::Base
	belongs_to :forest_type
	belongs_to :tree_badge
end
