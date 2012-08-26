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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120826090104) do

  create_table "categories", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active"
    t.string   "slug_ca"
    t.string   "slug_es"
    t.string   "slug_en"
  end

  add_index "categories", ["slug_ca"], :name => "index_categories_on_slug"
  add_index "categories", ["slug_en"], :name => "index_categories_on_slug_en"
  add_index "categories", ["slug_es"], :name => "index_categories_on_slug_es"

  create_table "category_translations", :force => true do |t|
    t.integer  "category_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "category_translations", ["category_id"], :name => "index_category_translations_on_category_id"

  create_table "illustration_translations", :force => true do |t|
    t.integer  "illustration_id"
    t.string   "locale"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "illustration_translations", ["illustration_id"], :name => "index_b0c98806d31be981f03b71bdd325c9417e68cd00"

  create_table "illustrations", :force => true do |t|
    t.string   "image"
    t.text     "thumbnail_coordinates"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug_ca"
    t.string   "slug_es"
    t.string   "slug_en"
  end

  add_index "illustrations", ["slug_ca"], :name => "index_illustrations_on_slug", :unique => true
  add_index "illustrations", ["slug_en"], :name => "index_illustrations_on_slug_en"
  add_index "illustrations", ["slug_es"], :name => "index_illustrations_on_slug_es"

  create_table "video_translations", :force => true do |t|
    t.integer  "video_id"
    t.string   "locale"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "video_translations", ["video_id"], :name => "index_video_translations_on_video_id"

  create_table "videos", :force => true do |t|
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug_ca"
    t.string   "slug_es"
    t.string   "slug_en"
  end

  add_index "videos", ["slug_ca"], :name => "index_videos_on_slug_ca"
  add_index "videos", ["slug_en"], :name => "index_videos_on_slug_en"
  add_index "videos", ["slug_es"], :name => "index_videos_on_slug_es"

end
