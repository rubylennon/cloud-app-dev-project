# frozen_string_literal: true

# application controller class containing shopping cart functionality
class ApplicationController < ActionController::Base
  include PublicActivity::StoreController

  rescue_from CanCan::AccessDenied do |_exception|
    redirect_to home_access_denied_path
  end

  def index; end

  def update; end

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
