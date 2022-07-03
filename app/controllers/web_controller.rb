class WebController < ApplicationController
  RECOMMEND_PRODUCTS_PER_PAGE = 15
  CATEGORIES_PER_PAGE = 15
  MAJOR_CATEGORY_NAMES_PER_PAGE = 15
  
  before_action :majorcategory_params, only: [:show]
  
  
  def index
    if sort_params.present?
      @category = Category.request_category(sort_params[:sort_category])
      @products = Product.sort_products(sort_params, params[:page])
    elsif params[:category].present?
      @category = Category.request_category(params[:category])
      @products = Product.category_products(@category, params[:page])
    else
      @products = Product.display_list(params[:page])
    end

    @major_categories = MajorCategory.all #
    #@categories = Category.all
    #@recommend_products = Product.order(created_at: "desc").where(notdisplay_flag: false).recommend_products(RECOMMEND_PRODUCTS_PER_PAGE)
  end
  
  
  def show
    @categories = Category.all #
    @major_categories = MajorCategory.all #
    @major_category_name = params[:name]
    @categories_show = Category.where(major_category_name: @major_category_name)
    logger.debug "dddddddddddddddddddddddddddddddddddddddArticle should be valid: #{@major_category_name.inspect}"
  end
  

  private
    def sort_params
      params.permit(:sort, :sort_category)
    end
    
    def majorcategory_params
      params[:name].present? ? params[:name]
                                            : "none"
    end 
end