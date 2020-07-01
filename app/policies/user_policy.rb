class UserPolicy < ApplicationPolicy
  class Scope < Scope
      def resolve
        if @user.admin == false
          scope.select{|u| u.assos.empty?}
        elsif @user.admin == true
          scope.all
        end
      end
  end

  def show?
    user == record
  end

  def index?
    # raise
    !!user
  end


  def new?
    !user
  end

  def create?
    # record = user
  end

end
