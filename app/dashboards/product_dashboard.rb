require "administrate/base_dashboard"

class ProductDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    sub_category: Field::BelongsTo,
    id: Field::Number,
    title: Field::String,
    description: Field::Text,
    specification: Field::Text,
    benefit: Field::Text,
    image: Field::String,
    video: Field::String,
    price: Field::Number.with_options(decimals: 2),
    price_actual: Field::String,
    rating: Field::Number,
    status: Field::Boolean,
    stock: Field::Boolean,
    stock_in_kilo: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    seo_name: Field::String,
    is_fixed_rate: Field::Boolean,
    category_name: Field::String,
    sub_category_name: Field::String,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :sub_category,
    :id,
    :title,
    :description,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :sub_category,
    :title,
    :description,
    :specification,
    :benefit,
    :image,
    :video,
    :price,
    :price_actual,
    :rating,
    :status,
    :stock,
    :stock_in_kilo,
    :seo_name,
    :is_fixed_rate,
    :category_name,
    :sub_category_name,
  ]
end
