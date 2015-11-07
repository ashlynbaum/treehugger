class Forest < ActiveRecord::Base
	has_many :trees
	belongs_to :forest_badge
end
