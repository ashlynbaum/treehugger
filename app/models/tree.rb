class Tree < ActiveRecord::Base
	belongs_to :forest
	belongs_to :tree_badge
end
