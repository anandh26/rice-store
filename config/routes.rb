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

  #products
  get 'shop-products', to: 'product#index', as: :shop_products
  get 'shop-products/:category', to: 'product#shop_by_category', as: :shop_products_category
  get 'shop-products/:category/:sub_category', to: 'product#shop_by_sub_category', as: :shop_products_sub_category
  get 'shop-products/:category/:sub_category/:seo_name', to: 'product#detail', as: :shop_products_detail

  #contact
  get 'contact-us', to: 'contact#index', as: :contact_us
  post 'contact-us', to: 'contact#create'

  #blog
  get 'blog', to: 'blog#index', as: :blog

  #sale
  get 'sales', to: 'sale#index', as: :sale

end
