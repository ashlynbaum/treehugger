class ForestsController < ApplicationController
	def show
		@forest = Forest.find(params[:id])
		@trees = @forest.trees
	end
end