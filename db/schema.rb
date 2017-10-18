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

ActiveRecord::Schema.define(version: 20171018081624) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blog_comments", force: :cascade do |t|
    t.string "api_key"
    t.string "from_name"
    t.string "from_email"
    t.text "comment"
    t.integer "status"
    t.bigint "blog_post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blog_post_id"], name: "index_blog_comments_on_blog_post_id"
  end

  create_table "blog_posts", force: :cascade do |t|
    t.string "api_key"
    t.string "title"
    t.string "slug"
    t.text "content"
    t.integer "status"
    t.bigint "user_id"
    t.string "tags"
    t.datetime "published_at"
    t.string "image"
    t.string "metatitle"
    t.text "metakeywords"
    t.text "metadescription"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_blog_posts_on_user_id"
  end

  create_table "keys", force: :cascade do |t|
    t.string "api_key"
    t.string "site"
    t.bigint "user_id"
    t.string "title"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.index ["user_id"], name: "index_keys_on_user_id"
  end

  create_table "portfolio_articles", force: :cascade do |t|
    t.string "api_key"
    t.string "title"
    t.string "slug"
    t.text "content"
    t.integer "status"
    t.string "tags"
    t.datetime "published_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "portfolio_categories", force: :cascade do |t|
    t.string "api_key"
    t.string "title"
    t.string "slug"
    t.text "content"
    t.bigint "parent_id"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_portfolio_categories_on_parent_id"
  end

  create_table "portfolio_feedbacks", force: :cascade do |t|
    t.string "api_key"
    t.bigint "portfolio_project_id"
    t.string "title"
    t.text "content"
    t.integer "status"
    t.datetime "published_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["portfolio_project_id"], name: "index_portfolio_feedbacks_on_portfolio_project_id"
  end

  create_table "portfolio_images", force: :cascade do |t|
    t.bigint "portfolio_project_id"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.text "content"
    t.string "api_key"
    t.index ["portfolio_project_id"], name: "index_portfolio_images_on_portfolio_project_id"
  end

  create_table "portfolio_projects", force: :cascade do |t|
    t.string "api_key"
    t.string "title"
    t.string "subtitle"
    t.string "slug"
    t.text "content"
    t.integer "status"
    t.integer "priority"
    t.string "customer"
    t.string "image"
    t.bigint "portfolio_category_id"
    t.string "metatitle"
    t.text "metakeywords"
    t.text "metadescription"
    t.datetime "published_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["portfolio_category_id"], name: "index_portfolio_projects_on_portfolio_category_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["name"], name: "index_roles_on_name"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "site_files", force: :cascade do |t|
    t.string "api_key"
    t.string "name"
    t.integer "size"
    t.datetime "modified"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "site_links", force: :cascade do |t|
    t.string "api_key"
    t.string "title"
    t.string "url"
    t.string "section"
    t.integer "status"
    t.boolean "is_visible_main"
    t.boolean "is_visible_offcanvas"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "site_mails", force: :cascade do |t|
    t.string "from_name"
    t.string "subject"
    t.text "message"
    t.integer "status"
    t.string "api_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "from_email"
  end

  create_table "site_pages", force: :cascade do |t|
    t.string "title"
    t.string "slug"
    t.text "content"
    t.integer "status"
    t.string "metatitle"
    t.text "metakeywords"
    t.text "metadescription"
    t.string "api_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "site_settings", force: :cascade do |t|
    t.string "api_key"
    t.string "key"
    t.text "value"
    t.integer "section"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "site_widgets", force: :cascade do |t|
    t.string "api_key"
    t.string "title"
    t.string "subtitle"
    t.text "content"
    t.string "section"
    t.integer "status"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "blog_comments", "blog_posts"
  add_foreign_key "blog_posts", "users"
  add_foreign_key "keys", "users"
  add_foreign_key "portfolio_feedbacks", "portfolio_projects"
  add_foreign_key "portfolio_images", "portfolio_projects"
  add_foreign_key "portfolio_projects", "portfolio_categories"
end
