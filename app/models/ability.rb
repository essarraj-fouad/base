class Ability

  include CanCan::Ability

  def initialize user
    user ||= User.new

    can :manage, :all if user.admin?

    cannot :destroy, User, id: user.id
    cannot :lock,    User, id: user.id
    cannot :unlock,  User, id: user.id
  end

end
