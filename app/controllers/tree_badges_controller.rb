class TreeBadgesController < ApplicationController
  def index
    @user = current_user
    all_user_badges = TreeBadge.where(user_id: current_user.id)
    # variable names:
   @badge_names =  ForestTypesHelper::FOREST_TYPES.values.collect {|name| "@" + name.downcase.tr(" ", "_") + "_badges"}

    # @badge_names =  ["@fernland_badges", "@manuka_badges", "@podocarp_giants_badges", "@mangrove_badges", "@deciduous_hardwood_badges", "@nothofagus_beech_badges", "@exotic_badges"]
    ForestTypesHelper::FOREST_TYPES.each do |key,value|
      forest_tree_ids = Forest.find_by(name: value).trees.pluck(:id)#[1,2,3,4,5]
      name = value.downcase.tr(" ", "_")# podocarp_giant
      query = all_user_badges.where(tree_id: forest_tree_ids)
      instance_variable_set("@#{name}_badges", query) #@podocarp_giant_badges
    end
  end

  def new
  	@badge = TreeBadge.new
  end

  def create
    # TODO: update images to be stored in image table
    @user = current_user
    @badge =TreeBadge.create({user_id: @user.id}.merge(badge_params))
    respond_to do |format|
      format.js {render inline: "location.reload();" }
    end
  end

  private
  def badge_params
    params.require(:tree_badge).permit(:tree_id, :image)
  end
end