class HomeController < ApplicationController
  def index
    # join_query = Product.joins(:sub_category).where("products.status = 't'").order("CREATED_AT DESC").all
    # @products = join_query.group_by(&:category_name)


    @products = Product.find_by_sql("
              SELECT prod.id, prod.title, cat.name as category_name, prod.* FROM products prod
               INNER JOIN sub_categories sub_cat ON sub_cat.id = prod.sub_category_id
                  INNER JOIN categories cat ON cat.id = sub_cat.category_id where prod.status = 't'").group_by(&:category_name)

    @shop_cart = ShoppingCart.find_by(unique_id:request.session_options[:id], status: 't')
    p @shop_cart
  end
end
