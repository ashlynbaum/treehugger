class DashboardsController < ApplicationController
	def index
		@user = current_user
		# TODO: only display forest types within specified radius
		@forests = forest.all
		
	end
end
