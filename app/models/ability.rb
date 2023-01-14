# frozen_string_literal: true

# @Ref - https://devtut.github.io/rubyonrails/authorization-with-cancan.html#handling-large-number-of-abilities
# Reference Description - tutorial on how to use CanCan gem
# ability model for user authorization using CanCan gem
class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user
      if user.admin?
        admin_abilities
      else
        authenticated_abilities
      end
    else
      guest_abilities
    end
  end

  private

  def guest_abilities
    # define abilities for visitors only
    can :read, Product
    can :read, Feed
    can :read, Entry
  end

  def authenticated_abilities
    # define abilities for logged users only
    can :read, Product
    can :manage, Profile
    can :manage, Order
    can :manage, OrderItem
    can :manage, User
    can :read, Feed
    can :read, Entry
  end

  def admin_abilities
    # define abilities for admins only
    # admins can do any action on any model or action
    can :manage, :all
  end
end
