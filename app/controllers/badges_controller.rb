class BadgesController < ApplicationController
  def index
    @user = current_user
    @badges = TreeBadge.where(user_id: @user.id)
    puts "***************"
    puts @badges.length
  end

end