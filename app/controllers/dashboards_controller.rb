class DashboardsController < ApplicationController
	def index
		@user = current_user
		# TODO: only display forest types within specified radius
		@ForrestTypes = ForestType.all
		
	end
end
