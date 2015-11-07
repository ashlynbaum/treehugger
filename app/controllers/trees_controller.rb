class TreesController < ApplicationController
	def index
		@forest = Forest.find(params[:forest_id])
		@trees = @forest.trees
	end
end