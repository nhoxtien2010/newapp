class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
      user ||= User.new # guest user (not logged in)

      alias_action :create, :read, :update, :destroy, :to => :crud

      if user_signed_in?

        if user.role.name == "admin"
          can :manage, :all
        elsif user.role.name == "manager"

          can :read, :all
        else  
              #user 
          can :crud, :all
        end
      end
   
  end
end
