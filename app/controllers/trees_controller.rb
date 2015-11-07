class TreesController < ApplicationController
	def index
		@forest = Forest.find(params[:forest_id])
		@trees = @forest.trees
	end

  def show
    @tree = Tree.find(params[:id])
  end
end