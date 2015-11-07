class ForestType < ActiveRecord::Base
	has_many :trees
	belongs_to :forest_type_badge
end
