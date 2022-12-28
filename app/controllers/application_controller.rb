class ApplicationController < ActionController::Base
    def index
    end

    before_action :current_cart

    def current_cart
        @current_cart ||= ShoppingCart.new(cart_token, current_user.id)
    end
    helper_method :current_cart

    private

    def cart_token
        return @cart_token unless @cart_token.nil?

        session[:cart_token] ||= SecureRandom.hex(8)
        @cart_token = session[:cart_token]
    end

    include PublicActivity::StoreController
end
