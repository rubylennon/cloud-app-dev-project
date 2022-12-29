# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    else
      can :read, Product
      can :manage, Profile
      can :manage, Order
      can :manage, OrderItem
      can :manage, User
      can :read, Category
      can :read, Feed
      can :read, Entry
    end
  end
end
