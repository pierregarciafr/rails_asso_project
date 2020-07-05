class AssoPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index
    true
    raise
  end

  def show
    true
  end

  def new
    !!user
  end

  def create
    record.user == user
  end

end
