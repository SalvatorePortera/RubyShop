class ShoppingCartsController < ApplicationController
  before_action :set_cart, only: %i[index create destroy remove_shopping_cart_item switch_express]
  
  def index
    @user_cart_items = ShoppingCartItem.user_cart_items(@user_cart)
    @products_index = Product.where(id: @user_cart_items.map(&:item_id)).index_by(&:id)
    @major_categories = MajorCategory.all #
  end
  
  def show
    @cart = ShoppingCart.find(user_id: current_user)
  end
  
  def create
    @product = Product.find(product_params[:product_id])
    @user_cart.add(@product, product_params[:price].to_i, product_params[:quantity].to_i)
    redirect_to cart_users_path
  end
  
  def update
  end
  
  def destroy
    
    @user_cart.buy_flag = true
    @user_cart.save

     Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
     Payjp::Charge.create( 
                           amount: @user_cart.total.to_i,
                           card: params['payjp-token'],
                           currency: 'jpy'
                         )
                         
      user_cart_items = ShoppingCartItem.user_cart_items(@user_cart)
    ShoppingCartMailer.order_confirmation(@user_cart, user_cart_items).deliver_now
      

    redirect_to cart_users_url
    
  end
  
  def remove_shopping_cart_item
    @product = Product.find_by(id: params[:product_id])
    @user_cart.remove(@product)
    redirect_to cart_users_path
  end
  
  def switch_express
    @user_cart.switch_express
    redirect_to cart_users_url
  end
  
  
  private
    def set_cart
      @user_cart = ShoppingCart.user_cart(current_user)
    end
    
    def product_params
      params.permit(:product_id, :price, :quantity)
    end
end
