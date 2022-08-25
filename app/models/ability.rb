class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :destroy, Post, author: user
    can :destroy, Comment, author: user

    return unless user&.role == 'admin'

    can :manag, :all
  end
end
