class ShoppingCartMailer < ApplicationMailer
    def order_confirmation(user_cart, user_cart_items)
    @user_cart = user_cart
    @user_cart_items = user_cart_items
    @products = Product.where(id: user_cart_items.map(&:item_id)).index_by(&:id)

    mail(to: ENV['ORDER_CONFIRMATION_MAIL_TO'], subject: '［Samazon2］商品が購入されました')
    end
end
