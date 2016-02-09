class HomeController < ApplicationController
  def index
    @products = Product.find_by_sql("
             SELECT c.id, c.title, m.name as category_name, c.* FROM products c
               INNER JOIN sub_categories u ON u.id = c.sub_category_id
                 INNER JOIN categories m ON m.id = u.category_id").group_by(&:category_name)
  end
end
