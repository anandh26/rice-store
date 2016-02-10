class ProductController < ApplicationController
  def index
    # @products = Product.find_by_sql("
    #          SELECT c.id, c.title, m.name as category_name, c.* FROM products c
    #            INNER JOIN sub_categories u ON u.id = c.sub_category_id
    #              INNER JOIN categories m ON m.id = u.category_id where c.status = 't'").group_by(&:category_name)
    #
    join_query = Product.select('products.*, sub_categories.category_name').joins(:sub_category).where("products.status = 't'").order("CREATED_AT DESC").all
    @products = join_query.group_by(&:category_name)
  end

  def detail
    @detail = Product.find_by(seo_name: params[:seo_name])
  end

  def shop_by_category
     join_query = Product.select('products.*, sub_categories.*').joins(:sub_category).where("products.status = 't' and sub_categories.category_name = '#{ params[:category]}'").order("CREATED_AT DESC").all
     @products = join_query.group_by(&:sub_category_name)

    # @products = Product.find_by_sql("
    #           SELECT prod.id, sub_cat.*, cat.name as category_name, prod.* FROM products prod
    #            INNER JOIN sub_categories sub_cat ON sub_cat.id = prod.sub_category_id
    #               INNER JOIN categories cat ON cat.id = sub_cat.category_id where prod.status = 't'").group_by(&:sub_category_name)

  end

  def shop_by_sub_category
    @products = Product.joins(:sub_category).where(" products.status = 't' and sub_categories.seo_name = '#{ params[:sub_category]}'").order("CREATED_AT DESC")
  end

  def shop_cart

  end

  def shop_checkout

  end

  def shop_payment

  end

  def shop_review

  end

  def shop_complete

  end
end
