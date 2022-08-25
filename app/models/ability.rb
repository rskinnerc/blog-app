# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)

    if user && user.role == 'admin' 
      can :delete, Post
    else
      can :delete, Post, author: user
    end
  end
end
