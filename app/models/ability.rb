# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the user here. For example:
    
    # if user.admin?
    #   can :manage, :all, Book
    # # else
    # #   can :manage, :all, Book, user: user
    # end
    # can :manage, :all
    # return unless user.member?
    # can :manage, :all, Book, public: true

    # user ||= User.new # Assuming you have a User model
    
    # Define the abilities for the user here
    if user.admin? # Replace admin? with the appropriate method that checks if the user is an admin
      can :manage, Book
    else
      can :manage, Book
    end

    # if user.admin?
    #   can :manage, :all, Book
    # # else
    # #   can :manage, :all, Book, user: user
    # end


    
      # return unless user.admin?  # additional permissions for administrators
      # can :read, Book
      
       
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, published: true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md
  end
end
