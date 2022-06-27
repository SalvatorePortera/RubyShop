class ShoppingCart < ApplicationRecord
    # 送料
    CARRIAGE = 700
    # 特急便価格
    EXPRESS_CARRIAGE = 700
    # 消費税税率
    TAX_PERCENT = 10
    # 消費税課税境界値
    BOUNDARY_VALUE_FOR_TAXING_CONSUMPTION_TAX = 5_000
    
    acts_as_shopping_cart
    
    scope :with_user, ->(user) { where(user_id: user.id, buy_flag: false) }
    scope :bought_carts, -> { where(buy_flag: true) }
   scope :bought_months_sqlite, -> { bought_carts.order(updated_at: :desc).group("strftime('%Y-%m', updated_at, '+09:00')").pluck(:updated_at) }
   scope :bought_days_sqlite, -> { bought_carts.order(updated_at: :desc).group("strftime('%Y-%m-%d', updated_at, '+09:00')").pluck(:updated_at) }
   scope :bought_months_pg, -> { bought_carts.pluck("distinct(date_trunc('month', updated_at + '9 hours'))").map{ |m| m.in_time_zone('Asia/Tokyo') }.reverse }
   scope :bought_days_pg, -> { bought_carts.pluck("distinct(date_trunc('day', updated_at + '9 hours'))").map{ |d| d.in_time_zone('Asia/Tokyo') }.reverse }
   scope :search_bought_carts_by_month, -> (month) { bought_carts.where(updated_at: month.all_month) }
   scope :search_bought_carts_by_day, -> (day) { bought_carts.where(updated_at: day.all_day) }
   scope :search_carts_by_ids, -> (ids) { where("id LIKE ?", "%#{ids}%") }
   scope :search_bought_carts_by_ids, -> (ids) { bought_carts.search_carts_by_ids(ids) }
   scope :search_carts_by_user, -> (user) { where(user_id: user) }
   scope :search_bought_carts_by_user, -> (user) { bought_carts.search_carts_by_user(user) }
   scope :sort_list, -> {
     {"日別": "daily", "月別": "month"}
   }
   
   def self.user_cart(user)
    with_user(user)&.last || ShoppingCart.create(user_id: user.id, is_express: :express)
   end

 
   def self.get_monthly_sales
     if Rails.env.production?
       months = bought_months_pg
     else
       months = bought_months_sqlite
     end
     
     array = Array.new(months.count) { Hash.new }
     
     months.each_with_index do |month, i|
       monthly_sales = search_bought_carts_by_month(month)
       total = 0
       
       monthly_sales.each do |monthly_sale|
         total += monthly_sale.total.fractional
       end   
       
       array[i][:period] = month.strftime("%Y-%m")
       array[i][:total] = total
       array[i][:count] = monthly_sales.count
       array[i][:average] = total / monthly_sales.count
     end
     
     return array
   end
 
   def self.get_daily_sales
     if Rails.env.production?
       days = bought_days_pg
     else
       days = bought_days_sqlite
     end    
     
     array = Array.new(days.count) { Hash.new }
     
     days.each_with_index do |day, i|
       daily_sales = search_bought_carts_by_day(day)
       total = 0
       
       daily_sales.each do |daily_sale|
         total += daily_sale.total.fractional
       end
       
       array[i][:period] = day.strftime("%Y-%m-%d")
       array[i][:total] = total
       array[i][:count] = daily_sales.count
       array[i][:average] = total / daily_sales.count
     end
     
     return array
   end
   
   def express?
    is_express
   end

  def switch_express
    update!(is_express: !is_express)
  end

  def tax_pct
    subtotal >= Money.new(BOUNDARY_VALUE_FOR_TAXING_CONSUMPTION_TAX) ? 0 : TAX_PERCENT
  end
                                              
  
  def shipping_cost
     product_ids = ShoppingCartItem.user_cart_item_ids(self.id)
     products_carriage_list = Product.check_products_carriage_list(product_ids)
     if products_carriage_list.include?(true)
      Money.new(CARRIAGE)
     else
      Money.new(0)
     end
  end
     
  def express_cost
    express? ? Money.new(EXPRESS_CARRIAGE) : Money.new(0)
  end

  def total
    super + express_cost
  end
end
