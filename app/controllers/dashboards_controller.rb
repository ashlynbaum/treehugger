class DashboardsController < ApplicationController
	def index
		@user = current_user
		# TODO: only display forest types within specified radius
		@forests = Forest.all
		
	end
end
