class DashboardsController < ApplicationController

  Result = Struct.new(:forest_type, :radius) do
    def forest_type_name
      ForestTypesHelper::FOREST_TYPES[forest_type]
    end
  end

  def landing
    @disable_nav = true
    if current_user
      redirect_to dashboards_path
    else
      render action: "landing"
    end
  end

	def index
		@user = current_user
		@forests = Forest.all
    @results = []
    render action: "index"
	end

  def forest_types
    @forests = Forest.all
    @results = get_forest_types(params[:x], params[:y], params[:radius])
    render action: "search"
  end

  private

  def get_forest_types(x,y,radius)
    x = 174.75878033265786 if x.nil? || x.empty?
    y = -41.29443668919478 if y.nil? || y.empty?
    radius = 10 if radius.nil? || radius.empty?
    raw_json = HTTParty.get "http://api.lris.scinfo.org.nz/api/vectorQuery.json?key=3479c35b1848488e88fa424047c58641&layer=423&x=#{x}&y=#{y}&max_results=10&radius=#{radius}"
    parsed_json = JSON.parse(raw_json)

    raw_results = parsed_json["vectorQuery"]["layers"]["423"]["features"]
    results_to_return = []

    raw_results.each do |result|
      forest_type = result["properties"]["Class_2012"]
      if ForestTypesHelper::FOREST_TYPES.include?(result["properties"]["Class_2012"])
        results_to_return << Result.new(forest_type, result["distance"])
      end
    end
    return results_to_return
  end
end
