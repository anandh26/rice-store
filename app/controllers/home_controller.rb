class HomeController < ApplicationController
  def index
    join_query = Product.select('products.*, sub_categories.*').joins(:sub_category).where("products.status = 't'").order("CREATED_AT DESC").all
    @products = join_query.group_by(&:category_name)
  end
end
