class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @interest = Interest.where(user: @user)[0]
    authorize current_user
  end

  def index
    policies = policy_scope(User).reject{|user| user.admin}
    # authorize current_user
    @users = policies.sort_by{|u| u.id}
    @user = current_user
  end
end
