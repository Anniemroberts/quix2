class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :manage, Idea do |i|
      i.user == user
    end

    can :manage, Review do |r|
      r.user == user
    end
  end
end
