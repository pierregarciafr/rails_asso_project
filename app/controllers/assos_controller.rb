class AssosController < ApplicationController
  def show
    @asso = Asso.find(params[:id])
    authorize @asso
  end

  def index
    policies = policy_scope(Asso)
    # authorize current_user
    if params[:query].present?
      results = Tag.joins(:asso, :field).where(fields: {name: params[:query]})
      @assos = results.map {|result| result.asso}
    else
      @assos = policies.sort_by {|asso| asso.name}
    end
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
