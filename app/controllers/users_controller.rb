class UsersController < ApplicationController
  before_action :set_user
  
  def edit
  end

  def update
    @user.update_without_password(user_params)
    redirect_to mypage_users_url
  end

  def mypage
  end
  
  def edit_address
  end
  
  def favorite
    @favorites = @user.likees(Product)
  end
  
  def cart_history_index
     @orders = ShoppingCart.search_bought_carts_by_user(@user).page(params[:page]).per(15)
  end
  
  def cart_history_show
     @cart = ShoppingCart.find(params[:num])
     @cart_items = ShoppingCartItem.user_cart_items(@cart.id)
  end
  
  private
    def user_params
    end
    
  def set_user
      @user = current_user
  end
end
