require "administrate/base_dashboard"

class CategoryDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    sub_categories: Field::HasMany,
    id: Field::Number,
    name: Field::String,
    teaser: Field::Text,
    description: Field::Text,
    status: Field::Boolean,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    icon: Field::String,
    rank: Field::Number,
    image_url: Field::String,
    url: Field::String,
    seo_name: Field::String,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :sub_categories,
    :id,
    :name,
    :teaser,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :sub_categories,
    :name,
    :teaser,
    :description,
    :status,
    :icon,
    :rank,
    :image_url,
    :url,
    :seo_name,
  ]
end
