class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new

    if user && user.admin?
      can :access, :rails_admin
      can :manage, :all

      cannot :destroy,     User, id: user.id
      cannot :lock_user,   User, id: user.id
      cannot :unlock_user, User, id: user.id
    end
  end
end
