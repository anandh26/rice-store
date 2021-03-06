# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160214151119) do

  create_table "carousels", force: :cascade do |t|
    t.text     "title"
    t.text     "description"
    t.string   "image"
    t.string   "alt"
    t.integer  "rank"
    t.boolean  "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.text     "teaser"
    t.text     "description"
    t.boolean  "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "icon"
    t.integer  "rank"
    t.string   "image_url"
    t.string   "url"
    t.string   "seo_name"
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "subject"
    t.text     "message"
    t.boolean  "is_internal"
    t.boolean  "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "menus", force: :cascade do |t|
    t.string   "name"
    t.string   "url"
    t.text     "description"
    t.integer  "rank"
    t.boolean  "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.text     "specification"
    t.text     "benefit"
    t.string   "image"
    t.string   "video"
    t.float    "price"
    t.string   "price_actual"
    t.integer  "rating"
    t.boolean  "status"
    t.boolean  "stock"
    t.integer  "stock_in_kilo"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "sub_category_id"
    t.string   "seo_name"
    t.boolean  "is_fixed_rate"
    t.string   "sub_category_name"
    t.string   "brand"
  end

  add_index "products", ["sub_category_id"], name: "index_products_on_sub_category_id"

  create_table "redeem_points", force: :cascade do |t|
    t.string   "email"
    t.integer  "point"
    t.integer  "point_used"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shopping_cart_products", force: :cascade do |t|
    t.string   "product_title"
    t.text     "product_description"
    t.float    "price"
    t.integer  "quantity"
    t.float    "total"
    t.boolean  "status"
    t.integer  "shopping_cart_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "product_did"
  end

  add_index "shopping_cart_products", ["shopping_cart_id"], name: "index_shopping_cart_products_on_shopping_cart_id"

  create_table "shopping_carts", force: :cascade do |t|
    t.string   "unique_id"
    t.string   "discount_coupon"
    t.integer  "discount_percentage"
    t.integer  "total_items"
    t.float    "sub_total"
    t.float    "total"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "telephone"
    t.string   "user_name"
    t.string   "email"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "zip_code"
    t.string   "country"
    t.string   "additional_info"
    t.string   "payment_type"
    t.boolean  "status"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "order_status"
    t.string   "shipment_type"
    t.integer  "points"
  end

  create_table "slide_contents", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.text     "icon"
    t.string   "image"
    t.integer  "rank"
    t.boolean  "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "sub_categories", force: :cascade do |t|
    t.string   "title"
    t.text     "teaser"
    t.text     "description"
    t.boolean  "status"
    t.integer  "rank"
    t.text     "icon"
    t.integer  "category_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "url"
    t.string   "seo_name"
    t.string   "category_name"
  end

  add_index "sub_categories", ["category_id"], name: "index_sub_categories_on_category_id"

  create_table "sub_menus", force: :cascade do |t|
    t.string   "name"
    t.string   "url"
    t.text     "description"
    t.integer  "rank"
    t.boolean  "status"
    t.integer  "menu_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "sub_menus", ["menu_id"], name: "index_sub_menus_on_menu_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "user_name"
    t.string   "password"
    t.string   "email"
    t.boolean  "status"
    t.boolean  "is_internal"
    t.string   "phone"
    t.string   "fax"
    t.text     "address_1"
    t.text     "address_2"
    t.string   "city"
    t.string   "region"
    t.integer  "postal_code"
    t.string   "country"
    t.string   "token"
    t.string   "user_agent"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "visitors", force: :cascade do |t|
    t.string   "unique_id"
    t.string   "browser_id"
    t.boolean  "is_internal"
    t.string   "ip_address"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
