Rails.application.routes.draw do
  namespace :admin do
    DashboardManifest::DASHBOARDS.each do |dashboard_resource|
      resources dashboard_resource
    end

    root controller: DashboardManifest::ROOT_DASHBOARD, action: :index
  end

  root 'home#index'

  get 'shop-cart', to: 'product#shop_cart', as: :shop_cart
  get 'shop-checkout', to: 'product#shop_checkout', as: :shop_checkout
  get 'shop-payment', to: 'product#shop_payment', as: :shop_payment
  get 'shop-review', to: 'product#shop_review', as: :shop_review
  get 'shop-complete', to: 'product#shop_complete', as: :shop_complete

  #user login
  get 'user/register', as: :registration
  post 'user/register', to: 'user#create'
  post 'user/login', to: 'user#sign_in', as: :sign_in
  get 'user/login', to: 'user#login', as: :user_login
  get 'user/sign-out', to: 'user#sign_out', as: :logout
  post 'user/sign-out', to: 'user#sign_out'
  get 'user/profile', to: 'user#profile', as: :profile
  post 'user/update-profile', to: 'user#update_profile', as: :update_profile
  get 'user/points', to: 'user#my_points', as: :my_points
  get 'user/orders', to: 'user#orders', as: :orders
  get 'user/coupons', to: 'user#my_coupons', as: :my_coupons

  #contact
  get 'contact-us', to: 'contact#index', as: :contact_us
  post 'contact-us', to: 'contact#create'

  #products
  get 'shop-products', to: 'product#index', as: :shop_products
  get '/:category', to: 'product#shop_by_category', as: :shop_products_category
  get '/:category/:sub_category', to: 'product#shop_by_sub_category', as: :shop_products_sub_category
  get '/:category/:sub_category/:seo_name', to: 'product#detail', as: :shop_products_detail
  post 'add-cart', to: 'product#add_cart', as: :add_cart
  get 'add-cart/result_page/:product_id/:quantity', to: 'product#add_cart', as: :add_cart_get_url
  post 'remove-cart', to: 'product#remove_cart', as: :remove_cart
  post 'update-checkout-cart', to: 'product#update_checkout_cart', as: :update_checkout_cart
  post 'update-shop-payment', to: 'product#update_shop_payment', as: :update_shop_payment
  post 'update-shop-review', to: 'product#update_shop_review', as: :update_shop_review

  #blog
  get 'blog', to: 'blog#index', as: :blog
  get 'about', to: 'blog#index', as: :about
  get 'privacy', to: 'blog#index', as: :privacy
  get 'terms-and-conditions', to: 'blog#index', as: :terms

  #sale
  get 'sales', to: 'sale#index', as: :sale

end
