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

ActiveRecord::Schema.define(:version => 20110306115116) do

  create_table "audits", :force => true do |t|
    t.integer  "auditable_id"
    t.string   "auditable_type"
    t.integer  "association_id"
    t.string   "association_type"
    t.integer  "user_id"
    t.string   "user_type"
    t.string   "username"
    t.string   "action"
    t.text     "audited_changes"
    t.integer  "version",          :default => 0
    t.datetime "created_at"
    t.string   "comment"
    t.string   "remote_address"
  end

  add_index "audits", ["association_id", "association_type"], :name => "auditable_parent_index"
  add_index "audits", ["auditable_id", "auditable_type"], :name => "auditable_index"
  add_index "audits", ["created_at"], :name => "index_audits_on_created_at"
  add_index "audits", ["user_id", "user_type"], :name => "user_index"

  create_table "auth_tokens", :force => true do |t|
    t.integer  "domain_id"
    t.integer  "user_id"
    t.string   "token",       :null => false
    t.text     "permissions", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "expires_at",  :null => false
  end

  create_table "domains", :force => true do |t|
    t.string   "name",                                             :null => false
    t.string   "master",          :limit => 20
    t.integer  "last_check"
    t.string   "type",            :limit => 6,                     :null => false
    t.integer  "notified_serial"
    t.string   "account",         :limit => 40
    t.integer  "ttl",                           :default => 86400
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.text     "notes"
  end

  add_index "domains", ["name"], :name => "name_index", :unique => true

  create_table "macro_steps", :force => true do |t|
    t.integer  "macro_id"
    t.string   "action"
    t.string   "record_type"
    t.string   "name"
    t.string   "content"
    t.integer  "ttl"
    t.integer  "prio"
    t.integer  "position",                      :null => false
    t.boolean  "active",      :default => true
    t.string   "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "macros", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "user_id"
    t.boolean  "active",      :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "record_templates", :force => true do |t|
    t.integer  "zone_template_id"
    t.string   "name"
    t.string   "record_type",      :null => false
    t.string   "content",          :null => false
    t.integer  "ttl",              :null => false
    t.integer  "prio"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "records", :force => true do |t|
    t.integer  "domain_id"
    t.string   "name"
    t.string   "type",        :limit => 6
    t.string   "content"
    t.integer  "ttl"
    t.integer  "prio"
    t.integer  "change_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "records", ["domain_id"], :name => "domain_id"
  add_index "records", ["name", "type"], :name => "index_records_on_name_and_type"
  add_index "records", ["name", "type"], :name => "nametype_index"
  add_index "records", ["name"], :name => "rec_name_index"

  create_table "supermasters", :id => false, :force => true do |t|
    t.string "ip",         :limit => 25, :null => false
    t.string "nameserver",               :null => false
    t.string "account",    :limit => 40
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "encrypted_password",        :limit => 128, :default => "",        :null => false
    t.string   "password_salt",                            :default => "",        :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.string   "state",                                    :default => "passive"
    t.datetime "deleted_at"
    t.boolean  "admin",                                    :default => false
    t.boolean  "auth_tokens",                              :default => false
    t.datetime "confirmation_sent_at"
    t.string   "reset_password_token"
    t.datetime "remember_created_at"
  end

  create_table "zone_templates", :force => true do |t|
    t.string   "name"
    t.integer  "ttl",        :default => 86400
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

end
