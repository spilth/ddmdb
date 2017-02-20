# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101007013820) do

  create_table "comments", :force => true do |t|
    t.string   "title",            :limit => 50
    t.string   "comment"
    t.datetime "created_at",                                    :null => false
    t.integer  "commentable_id",                 :default => 0, :null => false
    t.string   "commentable_type", :limit => 15,                :null => false
    t.integer  "user_id",                        :default => 0, :null => false
  end

  add_index "comments", ["user_id"], :name => "fk_comments_user"

  create_table "difficulties", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "xp_multiplier", :default => 1.0
  end

  add_index "difficulties", ["id"], :name => "index_difficulties_on_id"

  create_table "keywords", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "keywords", ["id"], :name => "index_keywords_on_id"

  create_table "keywords_miniatures", :id => false, :force => true do |t|
    t.integer "keyword_id",   :null => false
    t.integer "miniature_id", :null => false
  end

  add_index "keywords_miniatures", ["keyword_id", "miniature_id"], :name => "index_keywords_miniatures_on_keyword_id_and_miniature_id"
  add_index "keywords_miniatures", ["keyword_id"], :name => "index_keywords_miniatures_on_keyword_id"

  create_table "kinds", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "kinds", ["id"], :name => "index_kinds_on_id"

  create_table "miniatures", :force => true do |t|
    t.string   "name"
    t.integer  "number"
    t.integer  "release_id"
    t.integer  "type_id"
    t.integer  "subtype_id"
    t.integer  "source_id"
    t.integer  "source_page_number"
    t.integer  "setting_id"
    t.float    "challenge_rating"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "size_id"
    t.integer  "rarity_id"
    t.integer  "role_id"
    t.integer  "difficulty_id"
    t.integer  "level"
    t.boolean  "leader",              :default => false, :null => false
    t.integer  "origin_id"
    t.integer  "kind_id"
    t.integer  "source2_id"
    t.integer  "source2_page_number"
    t.text     "notes"
  end

  add_index "miniatures", ["id"], :name => "index_miniatures_on_id"

  create_table "names", :force => true do |t|
    t.string   "race"
    t.string   "gender"
    t.string   "kind"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "origins", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "origins", ["id"], :name => "index_origins_on_id"

  create_table "ownerships", :force => true do |t|
    t.integer "user_id",                         :null => false
    t.integer "miniature_id",                    :null => false
    t.integer "have_count",   :default => 0,     :null => false
    t.boolean "favorite",     :default => false, :null => false
  end

  create_table "rarities", :force => true do |t|
    t.string   "name"
    t.string   "abbreviation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rarities", ["id"], :name => "index_rarities_on_id"

  create_table "releases", :force => true do |t|
    t.string   "name"
    t.string   "abbreviation"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "path"
    t.date     "released_on"
  end

  add_index "releases", ["id"], :name => "index_releases_on_id"
  add_index "releases", ["released_on"], :name => "index_releases_on_released_on"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "xp_multiplier", :default => 1.0
  end

  add_index "roles", ["id"], :name => "index_roles_on_id"

  create_table "settings", :force => true do |t|
    t.string   "name"
    t.string   "abbreviation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "settings", ["id"], :name => "index_settings_on_id"

  create_table "sizes", :force => true do |t|
    t.string   "name"
    t.string   "abbreviation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sizes", ["id"], :name => "index_sizes_on_id"

  create_table "sources", :force => true do |t|
    t.string   "name"
    t.string   "abbreviation"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "edition",      :default => 3, :null => false
  end

  add_index "sources", ["id"], :name => "index_sources_on_id"

  create_table "subtypes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subtypes", ["id"], :name => "index_subtypes_on_id"

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type"], :name => "index_taggings_on_taggable_id_and_taggable_type"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description"
  end

  add_index "types", ["id"], :name => "index_types_on_id"

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.boolean  "admin",                                   :default => false
  end

  add_index "users", ["id"], :name => "index_users_on_id"

end
