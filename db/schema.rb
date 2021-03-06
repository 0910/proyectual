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

ActiveRecord::Schema.define(version: 20170214115712) do

  create_table "about_translations", force: :cascade do |t|
    t.integer  "about_id",    limit: 4,     null: false
    t.string   "locale",      limit: 255,   null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.text     "short_about", limit: 65535
    t.text     "long_about",  limit: 65535
  end

  add_index "about_translations", ["about_id"], name: "index_about_translations_on_about_id", using: :btree
  add_index "about_translations", ["locale"], name: "index_about_translations_on_locale", using: :btree

  create_table "abouts", force: :cascade do |t|
    t.text     "short_about",        limit: 65535
    t.text     "long_about",         limit: 65535
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "cover_file_name",    limit: 255
    t.string   "cover_content_type", limit: 255
    t.integer  "cover_file_size",    limit: 4
    t.datetime "cover_updated_at"
  end

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace",     limit: 255
    t.text     "body",          limit: 65535
    t.string   "resource_id",   limit: 255,   null: false
    t.string   "resource_type", limit: 255,   null: false
    t.integer  "author_id",     limit: 4
    t.string   "author_type",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "artist_translations", force: :cascade do |t|
    t.integer  "artist_id",  limit: 4,     null: false
    t.string   "locale",     limit: 255,   null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.text     "bio",        limit: 65535
  end

  add_index "artist_translations", ["artist_id"], name: "index_artist_translations_on_artist_id", using: :btree
  add_index "artist_translations", ["locale"], name: "index_artist_translations_on_locale", using: :btree

  create_table "artists", force: :cascade do |t|
    t.string   "name",             limit: 255
    t.string   "resident_advisor", limit: 255
    t.string   "facebook",         limit: 255
    t.string   "soundcloud",       limit: 255
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.string   "slug",             limit: 255
    t.string   "available",        limit: 255,   default: "Yes"
    t.text     "bio",              limit: 65535
  end

  create_table "event_artists", force: :cascade do |t|
    t.integer  "event_id",   limit: 4
    t.integer  "artist_id",  limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "event_artists", ["artist_id"], name: "index_event_artists_on_artist_id", using: :btree
  add_index "event_artists", ["event_id"], name: "index_event_artists_on_event_id", using: :btree

  create_table "event_connections", id: false, force: :cascade do |t|
    t.integer "event_a_id", limit: 4, null: false
    t.integer "event_b_id", limit: 4, null: false
  end

  create_table "event_translations", force: :cascade do |t|
    t.integer  "event_id",    limit: 4,     null: false
    t.string   "locale",      limit: 255,   null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.text     "description", limit: 65535
  end

  add_index "event_translations", ["event_id"], name: "index_event_translations_on_event_id", using: :btree
  add_index "event_translations", ["locale"], name: "index_event_translations_on_locale", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "name",                     limit: 255
    t.string   "video",                    limit: 255
    t.string   "website",                  limit: 255
    t.string   "facebook",                 limit: 255
    t.string   "resident_advisor",         limit: 255
    t.text     "description",              limit: 65535
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
    t.string   "slug",                     limit: 255
    t.integer  "year_id",                  limit: 4
    t.string   "available",                limit: 255,   default: "Yes"
    t.string   "featured",                 limit: 255,   default: "No"
    t.string   "subtitle",                 limit: 255
    t.string   "video_cover_file_name",    limit: 255
    t.string   "video_cover_content_type", limit: 255
    t.integer  "video_cover_file_size",    limit: 4
    t.datetime "video_cover_updated_at"
    t.string   "youtube",                  limit: 255
    t.string   "instagram",                limit: 255
    t.string   "twitter",                  limit: 255
  end

  create_table "images", force: :cascade do |t|
    t.string   "file_file_name",    limit: 255
    t.string   "file_content_type", limit: 255
    t.integer  "file_file_size",    limit: 4
    t.datetime "file_updated_at"
    t.integer  "artist_id",         limit: 4
    t.integer  "event_id",          limit: 4
    t.integer  "video_id",          limit: 4
    t.integer  "news_id",           limit: 4
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.boolean  "cover",             limit: 1,   default: false
  end

  add_index "images", ["artist_id"], name: "index_images_on_artist_id", using: :btree
  add_index "images", ["event_id"], name: "index_images_on_event_id", using: :btree
  add_index "images", ["news_id"], name: "index_images_on_news_id", using: :btree
  add_index "images", ["video_id"], name: "index_images_on_video_id", using: :btree

  create_table "news", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.text     "body",       limit: 65535
    t.datetime "date"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "slug",       limit: 255
    t.string   "available",  limit: 255,   default: "Yes"
    t.string   "subtitle",   limit: 255
  end

  create_table "news_translations", force: :cascade do |t|
    t.integer  "news_id",    limit: 4,     null: false
    t.string   "locale",     limit: 255,   null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "title",      limit: 255
    t.text     "body",       limit: 65535
  end

  add_index "news_translations", ["locale"], name: "index_news_translations_on_locale", using: :btree
  add_index "news_translations", ["news_id"], name: "index_news_translations_on_news_id", using: :btree

  create_table "partners", force: :cascade do |t|
    t.string   "name",              limit: 255
    t.string   "link",              limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "logo_file_name",    limit: 255
    t.string   "logo_content_type", limit: 255
    t.integer  "logo_file_size",    limit: 4
    t.datetime "logo_updated_at"
  end

  create_table "splash_translations", force: :cascade do |t|
    t.integer  "splash_id",      limit: 4,   null: false
    t.string   "locale",         limit: 255, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "title",          limit: 255
    t.string   "subtitle",       limit: 255
    t.string   "call_to_action", limit: 255
  end

  add_index "splash_translations", ["locale"], name: "index_splash_translations_on_locale", using: :btree
  add_index "splash_translations", ["splash_id"], name: "index_splash_translations_on_splash_id", using: :btree

  create_table "splashes", force: :cascade do |t|
    t.string   "title",              limit: 255
    t.string   "subtitle",           limit: 255
    t.string   "call_to_action",     limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
    t.string   "link",               limit: 255
  end

  create_table "video_categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "videos", force: :cascade do |t|
    t.string   "name",              limit: 255
    t.string   "link",              limit: 255
    t.integer  "video_category_id", limit: 4
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.string   "slug",              limit: 255
    t.string   "available",         limit: 255, default: "Yes"
  end

  add_index "videos", ["video_category_id"], name: "index_videos_on_video_category_id", using: :btree

  create_table "years", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_foreign_key "event_artists", "artists"
  add_foreign_key "event_artists", "events"
  add_foreign_key "images", "artists"
  add_foreign_key "images", "events"
  add_foreign_key "images", "news"
  add_foreign_key "images", "videos"
  add_foreign_key "videos", "video_categories"
end
