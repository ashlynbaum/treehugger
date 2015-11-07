class ForestTypeBadge < ActiveRecord::Base
  belongs_to :user
  belongs_to :forest_type
end
