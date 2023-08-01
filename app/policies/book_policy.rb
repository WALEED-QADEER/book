class BookPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(title: "code")
      end
    end
    
  end
  
  # def index?
  #   user.admin? or user.member?
  # end
end
