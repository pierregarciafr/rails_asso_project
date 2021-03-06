class RelationshipsController < ApplicationController
  # before_action :logged_in_user # -- Create helper
  def create
    user = User.find(params[:followed_id])
    authorize current_user
    current_user.follow(user)
    flash[:success] = "You are now following #{user}"
    redirect_to user
  end

  def destroy
    user = Relationship.find(params[:id]).followed
    authorize current_user
    current_user.unfollow(user)
    flash[:success] = "You have succesfully unfollowed #{user}"
    redirect_to user
  end
end
