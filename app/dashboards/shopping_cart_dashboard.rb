require "administrate/base_dashboard"

class ShoppingCartDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    shopping_cart_products: Field::HasMany,
    id: Field::Number,
    unique_id: Field::String,
    discount_coupon: Field::String,
    discount_percentage: Field::Number,
    total_items: Field::Number,
    sub_total: Field::Number.with_options(decimals: 2),
    total: Field::Number.with_options(decimals: 2),
    first_name: Field::String,
    last_name: Field::String,
    telephone: Field::String,
    user_name: Field::String,
    email: Field::String,
    address1: Field::String,
    address2: Field::String,
    city: Field::String,
    zip_code: Field::String,
    country: Field::String,
    additional_info: Field::String,
    payment_type: Field::String,
    status: Field::Boolean,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    order_status: Field::String,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :shopping_cart_products,
    :id,
    :unique_id,
    :discount_coupon,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :shopping_cart_products,
    :unique_id,
    :discount_coupon,
    :discount_percentage,
    :total_items,
    :sub_total,
    :total,
    :first_name,
    :last_name,
    :telephone,
    :user_name,
    :email,
    :address1,
    :address2,
    :city,
    :zip_code,
    :country,
    :additional_info,
    :payment_type,
    :status,
    :order_status,
  ]
end
