class ForestsController < ApplicationController
	def show
		@user = current_user
		@forest = Forest.find(params[:id])
		@trees = @forest.trees
		@badges = TreeBadge.where(user_id: @user.id)
	end
end