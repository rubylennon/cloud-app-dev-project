# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include PublicActivity::StoreController

  def index; end

  before_action :current_cart, only: [:update]

  def current_cart
    @current_cart ||= ShoppingCart.new(cart_token, cart_user)
  end
  helper_method :current_cart

  private

  def cart_token
    return @cart_token unless @cart_token.nil?

    session[:cart_token] ||= SecureRandom.hex(8)
    @cart_token = session[:cart_token]
  end

  def cart_user
    return @cart_user unless @cart_user.nil?

    @cart_user ||= current_user.id
  end
end
