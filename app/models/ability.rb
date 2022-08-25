# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)

    if user && user.role == 'admin' 
      can :delete, Post
      can :delete, Comment
    else
      can :delete, Post, author: user
      can :delete, Comment, author: user
    end
  end
end
