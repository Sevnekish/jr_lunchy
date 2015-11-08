class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user.admin?
      can :manage, :all
    else
      can :read, :all #TODO can't read all, change it
      can :manage, User, :id => user.id
      can :read, :create, Order
      # can [:update, :services], Service do |service|
      #   service.try(:user_id) == user.id
      # end
    end
  end

end
