class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    def index
      true
    end

    def show
      true
    end

    def new
      !user
    end

    def create
      # record = user
    end

  end
end
