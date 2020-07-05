class AssosController < ApplicationController
  def show
    @asso = Asso.find(params[:id])
    authorize @asso
  end

  def index
    @assos = policy_scope(Asso)
    # authorize current_user
    @users = policies.sort_by{|asso| asso.name}
    @user = current_user

  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
