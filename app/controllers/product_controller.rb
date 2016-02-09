class ProductController < ApplicationController
  def index
    @products = Product.find_by_sql("
             SELECT c.id, c.title, m.name as category_name, c.* FROM products c
               INNER JOIN sub_categories u ON u.id = c.sub_category_id
                 INNER JOIN categories m ON m.id = u.category_id").group_by(&:category_name)

  end

  def detail
    @detail = Product.find_by(seo_name: params[:seo_name])
  end

  def shop_by_category
    @products = Product.find_by_sql("
             SELECT c.id, c.title, m.name as category_name, m.seo_name as seoname, c.* FROM products c
               INNER JOIN sub_categories u ON u.id = c.sub_category_id
                 INNER JOIN categories m ON m.id = u.category_id where lower(category_name) = '#{params[:category]}' ").group_by(&:category_name)
  end

  def shop_by_sub_category
    @products = Product.find_by_sql("
             SELECT c.id, c.title, u.seo_name as category_name, u.seo_name as seoname, c.* FROM products c
               INNER JOIN sub_categories u ON u.id = c.sub_category_id
                 where lower(category_name) = '#{params[:sub_category]}' ").group_by(&:category_name)

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
