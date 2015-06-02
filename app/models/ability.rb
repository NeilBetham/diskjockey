class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      if user.role == "admin"
        can :manage, :all
      elsif user.role == "broadcast"
        can [:index, :show, :new, :edit, :create, :update], User
        can [:index, :show, :new, :create], DjApplication
      elsif user.role == "dj"
        can [:show, :edit, :update, :destroy], User, id: user.id
        can [:show, :new, :create], DjApplication, user_id: user.id
      elsif user.role == "inactive"

      elsif user.role == "blocked"

      end
    else
      can :create, User
    end
  end
end
