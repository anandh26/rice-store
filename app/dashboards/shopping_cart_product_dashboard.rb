require "administrate/base_dashboard"

class ShoppingCartProductDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    shopping_cart: Field::BelongsTo,
    id: Field::Number,
    product_title: Field::String,
    product_description: Field::Text,
    price: Field::Number.with_options(decimals: 2),
    quantity: Field::Number,
    total: Field::Number.with_options(decimals: 2),
    status: Field::Boolean,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    product_did: Field::Number,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :shopping_cart,
    :id,
    :product_title,
    :product_description,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :shopping_cart,
    :product_title,
    :product_description,
    :price,
    :quantity,
    :total,
    :status,
    :product_did,
  ]
end
