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
     # join_query = Product.select('products.*, sub_categories.*').joins(:sub_category).
     #     where("products.status = 't' and sub_categories.category_name = '#{params[:category]}'").order("CREATED_AT DESC").all
     # @products = join_query.group_by(&:sub_category_name)

     @products = Product.find_by_sql("
               SELECT prod.id, sub_cat.*, prod.* FROM products prod
                INNER JOIN sub_categories sub_cat ON sub_cat.id = prod.sub_category_id
                INNER JOIN categories cat ON cat.id = sub_cat.category_id where prod.status = 't'
                and lower(cat.seo_name) = '#{params[:category].downcase}' order by prod.created_at desc").
         group_by(&:sub_category_name)

  end

  def shop_by_sub_category
    @products = Product.joins(:sub_category).where(" products.status = 't' and
sub_categories.seo_name = '#{ params[:sub_category]}'").order("CREATED_AT DESC")
  end

  def shop_cart
    @shop_cart = ShoppingCart.find_by(unique_id:request.session_options[:id], status: 't', order_status: 'pending')
  end

  def add_cart
    @shop_cart = ShoppingCart.find_or_create_by(unique_id:request.session_options[:id], status: 't', order_status: 'pending')

    product = Product.find_by(id: params[:product_id])
    if product.present?
      item = ShoppingCartProduct.find_by(product_did: params[:product_id], shopping_cart_id: @shop_cart.id)
      if item.present?
        @shop_cart.shopping_cart_products.each do |cart|
          if cart.product_did == params[:product_id].to_i && cart.shopping_cart_id == @shop_cart.id
            cart.destroy
            create_shopping_product_cart(product)
          end
        end
      else
        create_shopping_product_cart(product)
      end
    end

    respond_to do |format|
      format.json { render json: { done: 'true', status: 200 } }
    end
  end

  def remove_cart
    @shop_cart = ShoppingCart.find_by(unique_id:request.session_options[:id], status: 't', order_status: 'pending')
    @shop_cart.shopping_cart_products.each do |cart|
      if cart.id == params[:id].to_i
        cart.destroy
      end
    end
    respond_to do |format|
      format.json { render json: { done: 'true', status: 200 } }
    end
  end

  def shop_checkout
    @shop_cart = ShoppingCart.find_by(unique_id:request.session_options[:id], status: 't', order_status: 'pending')
  end

  def update_checkout_cart
    shop_cart = ShoppingCart.find_by(unique_id:request.session_options[:id], status: 't', order_status: 'pending')
    shop_cart.first_name = params[:first_name]
    shop_cart.last_name = params[:last_name]
    shop_cart.email = params[:email]
    shop_cart.telephone = params[:telephone]
    shop_cart.address1 = params[:address1]
    shop_cart.address2 = params[:address2]
    shop_cart.city = params[:city]
    shop_cart.country = params[:country]
    shop_cart.zip_code = params[:zip_code]
    shop_cart.additional_info = params[:additional_info]
    shop_cart.total_items = @shop_cart.shopping_cart_products.count
    shop_cart.sub_total = total_products_price(@shop_cart.shopping_cart_products)
    shop_cart.total = total_products_price(@shop_cart.shopping_cart_products)

    shop_cart.save
    redirect_to shop_payment_path
  end

  def shop_payment
  end

  def update_shop_payment
    shop_cart = ShoppingCart.find_by(unique_id:request.session_options[:id], status: 't', order_status: 'pending')
    if shop_cart.present?
      shop_cart.payment_type = 'cash'
      shop_cart.save
    end
    redirect_to shop_review_path
  end

  def shop_review
    @shop_cart = ShoppingCart.find_by(unique_id:request.session_options[:id], status: 't', order_status: 'pending')
  end

  def update_shop_review
    shop_cart = ShoppingCart.find_by(unique_id:request.session_options[:id], status: 't', order_status: 'pending')
    if shop_cart.present?
      shop_cart.order_status = 'delivered'
      shop_cart.save
    end

    redirect_to shop_complete_path
  end

  def shop_complete
    shop_cart = ShoppingCart.find_by(unique_id:request.session_options[:id], status: 't', order_status: 'pending')
    if shop_cart.present?
      shop_cart.order_status = 'done'
      shop_cart.save
    end
  end

  private
  def total_products_price(products)
    sum = 0
    products.each do |prod|
      sum += prod.price.to_i * prod.quantity
    end
    sum
  end

  def create_shopping_product_cart(product)
    @shop_cart.shopping_cart_products.create(product_did: params[:product_id],
                                             product_title: product.title,
                                             product_description: product.description,
                                             price: product.price_actual,
                                             quantity: params[:quantity],
                                             total: calculate_product_total(product.price_actual),
                                             status: 't'
                                             )
  end

  def calculate_product_total(price)
    if params[:quantity].present?
      params[:quantity].to_i * price.to_i
    end
  end
end
