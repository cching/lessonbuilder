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

ActiveRecord::Schema.define(:version => 20141005230751) do

  create_table "admin_notes", :force => true do |t|
    t.string   "resource_id",     :null => false
    t.string   "resource_type",   :null => false
    t.integer  "admin_user_id"
    t.string   "admin_user_type"
    t.text     "body"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "admin_notes", ["admin_user_type", "admin_user_id"], :name => "index_admin_notes_on_admin_user_type_and_admin_user_id"
  add_index "admin_notes", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  create_table "anchor_standards", :force => true do |t|
    t.string   "standard_id"
    t.integer  "new_id"
    t.string   "amsubj_ord"
    t.string   "assubj_ord"
    t.string   "tsubject"
    t.text     "content"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "answers", :force => true do |t|
    t.text     "answer"
    t.integer  "multiple_id"
    t.boolean  "correct"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "aquestions", :force => true do |t|
    t.text     "content"
    t.string   "standard_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "level"
  end

  create_table "assessments", :force => true do |t|
    t.integer  "select_id"
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "book_grades", :force => true do |t|
    t.integer  "grade_id"
    t.integer  "book_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "book_grades", ["book_id", "grade_id"], :name => "index_book_grades_on_book_id_and_grade_id"

  create_table "books", :force => true do |t|
    t.string   "author"
    t.text     "publisher"
    t.string   "title"
    t.text     "assess_questions"
    t.text     "availability"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.text     "example"
    t.integer  "textcategory_id"
    t.string   "isbn"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.boolean  "pdf",                :default => false
    t.text     "comments",           :default => ""
  end

  add_index "books", ["textcategory_id"], :name => "index_books_on_textcategory_id"

  create_table "booksources", :force => true do |t|
    t.integer  "book_id"
    t.integer  "source_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "booksources", ["source_id", "book_id"], :name => "index_booksources_on_source_id_and_book_id"

  create_table "caquestions", :force => true do |t|
    t.integer  "standard_id"
    t.integer  "select_id"
    t.text     "content"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                  :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_ckeditor_assetable_type"

  create_table "clinks", :force => true do |t|
    t.integer  "select_id"
    t.string   "standard_id"
    t.string   "comment"
    t.string   "link"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "cquestions", :force => true do |t|
    t.integer  "select_id"
    t.string   "content"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "standard_id"
  end

  create_table "cskills", :force => true do |t|
    t.integer  "select_id"
    t.string   "standard_id"
    t.string   "content"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "cstrategies", :force => true do |t|
    t.integer  "select_id"
    t.string   "standard_id"
    t.string   "content"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "cvocabs", :force => true do |t|
    t.integer  "select_id"
    t.string   "standard_id"
    t.string   "content"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "disticts", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "districts", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "grades", :force => true do |t|
    t.string "number"
    t.string "name"
  end

  create_table "headers", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "plan_id"
    t.integer  "select_id"
    t.boolean  "initiate"
  end

  create_table "i_cans", :force => true do |t|
    t.integer  "standard_id"
    t.text     "content"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "lesson_resources", :force => true do |t|
    t.integer  "select_id"
    t.text     "book"
    t.text     "notes"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
  end

  create_table "lessonplans", :force => true do |t|
    t.text     "content"
    t.integer  "select_id",   :default => 0
    t.integer  "district_id"
    t.boolean  "duplicate",   :default => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.string   "name"
    t.text     "writing",     :default => ""
    t.text     "conclusion",  :default => ""
    t.text     "questions",   :default => ""
  end

  create_table "lessons", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "links", :force => true do |t|
    t.string  "standard_id"
    t.text    "comment"
    t.text    "link"
    t.integer "user_id",     :default => 0
    t.boolean "duplicate",   :default => false
  end

  create_table "math_subsubjects", :force => true do |t|
    t.string "name"
  end

  create_table "multiples", :force => true do |t|
    t.text     "question"
    t.integer  "assessment_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "standard_id"
  end

  create_table "plans", :force => true do |t|
    t.string   "name"
    t.integer  "district_id"
    t.integer  "select_id"
    t.boolean  "initiate"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "questions", :force => true do |t|
    t.string  "standard_id"
    t.string  "content"
    t.integer "user_id",     :default => 0
    t.boolean "duplicate",   :default => false
  end

  create_table "rcategories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "resources", :force => true do |t|
    t.text     "content"
    t.text     "media"
    t.text     "title"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.integer  "rcategory_id"
  end

  create_table "searches", :force => true do |t|
    t.integer  "grade_id"
    t.integer  "subject_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "text_id"
  end

  create_table "select_aquestions", :force => true do |t|
    t.integer  "xaquestion_id"
    t.integer  "select_id"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.boolean  "initiate",      :default => false
    t.text     "content",       :default => ""
  end

  create_table "select_grades", :force => true do |t|
    t.integer  "grade_id"
    t.integer  "select_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "select_links", :force => true do |t|
    t.integer  "select_id"
    t.integer  "xlink_id"
    t.text     "comment"
    t.text     "link"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.boolean  "initiate",   :default => false
  end

  create_table "select_mainsubjects", :force => true do |t|
    t.integer  "subject_id"
    t.integer  "select_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "select_questions", :force => true do |t|
    t.integer  "select_id"
    t.integer  "xquestion_id"
    t.string   "content"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.boolean  "initiate",     :default => false
  end

  create_table "select_skills", :force => true do |t|
    t.integer  "select_id"
    t.integer  "xskill_id"
    t.string   "content"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.boolean  "initiate",   :default => false
  end

  create_table "select_sources", :force => true do |t|
    t.integer  "source_id"
    t.integer  "select_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "select_standards", :force => true do |t|
    t.integer  "standard_id"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "select_strategies", :force => true do |t|
    t.integer  "select_id"
    t.integer  "xstrategy_id"
    t.string   "content"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.boolean  "initiates",    :default => false
  end

  create_table "select_subjects", :force => true do |t|
    t.integer  "select_id"
    t.integer  "subsubject_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "select_texts", :force => true do |t|
    t.integer  "select_id"
    t.integer  "book_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "select_vocabs", :force => true do |t|
    t.integer  "select_id"
    t.integer  "xvocab_id"
    t.string   "content_english"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.boolean  "initiate",        :default => false
  end

  create_table "selections", :force => true do |t|
    t.text     "standard_id"
    t.integer  "select_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.boolean  "initiate"
  end

  create_table "selects", :force => true do |t|
    t.integer  "user_id"
    t.integer  "grade_id",                :default => 1
    t.integer  "text_id"
    t.integer  "subject_id",              :default => 1
    t.integer  "subsubject_id",           :default => 1
    t.string   "name",                    :default => ""
    t.date     "date"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.boolean  "private",                 :default => false
    t.string   "description",             :default => ""
    t.text     "objective",               :default => ""
    t.string   "book",                    :default => ""
    t.text     "notes"
    t.integer  "book_id"
    t.text     "vocabulary",              :default => ""
    t.text     "writing",                 :default => ""
    t.text     "conclusion",              :default => ""
    t.text     "questions",               :default => ""
    t.text     "textdependent",           :default => ""
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.string   "status"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.text     "sanitize_notes"
    t.string   "resource_id"
    t.string   "auth_key"
  end

  create_table "shorts", :force => true do |t|
    t.text     "question"
    t.integer  "assessment_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "standard_id"
  end

  create_table "skills", :force => true do |t|
    t.string  "standard_id"
    t.string  "content"
    t.integer "user_id",     :default => 0
    t.boolean "duplicate",   :default => false
  end

  create_table "sources", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "standards", :id => false, :force => true do |t|
    t.string  "id",                     :null => false
    t.integer "subject_id"
    t.integer "grade_id"
    t.integer "subsubject_id"
    t.string  "subsubject"
    t.text    "content"
    t.string  "successive_standard_id"
    t.integer "similar_standard_id"
    t.integer "standard_id"
  end

  create_table "strategies", :force => true do |t|
    t.string  "standard_id"
    t.string  "content"
    t.integer "user_id",     :default => 0
    t.boolean "duplicate",   :default => false
  end

  create_table "students", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "unique_identifier",                      :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.integer  "user_id"
    t.string   "name"
  end

  add_index "students", ["email"], :name => "index_students_on_email", :unique => true
  add_index "students", ["reset_password_token"], :name => "index_students_on_reset_password_token", :unique => true

  create_table "subjects", :force => true do |t|
    t.string "name"
  end

  create_table "subsubjects", :force => true do |t|
    t.string "name"
  end

  create_table "tests", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "textcategories", :force => true do |t|
    t.string  "category"
    t.integer "subject_id"
  end

  create_table "texts", :force => true do |t|
    t.integer "grade_id"
    t.string  "subject"
    t.string  "author"
    t.string  "title"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "encrypted_password",     :default => "",    :null => false
    t.boolean  "admin",                  :default => false
    t.integer  "district_id",            :default => 1
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "vocabs", :force => true do |t|
    t.string  "standard_id"
    t.string  "content_english"
    t.string  "content_spanish"
    t.integer "user_id",         :default => 0
    t.boolean "duplicate",       :default => false
  end

  create_table "xaquestions", :force => true do |t|
    t.string   "content"
    t.string   "standard_id"
    t.integer  "select_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "xlinks", :force => true do |t|
    t.text     "comment"
    t.text     "link"
    t.string   "standard_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "select_id"
  end

  create_table "xquestions", :force => true do |t|
    t.string   "content"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.string   "standard_id"
    t.integer  "select_id"
    t.boolean  "bold",        :default => false
    t.boolean  "highlight",   :default => false
    t.boolean  "italic",      :default => false
    t.integer  "position"
  end

  create_table "xskills", :force => true do |t|
    t.text     "content"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "standard_id"
    t.integer  "select_id"
  end

  create_table "xstrategies", :force => true do |t|
    t.text     "content"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "standard_id"
    t.integer  "select_id"
  end

  create_table "xvocabs", :force => true do |t|
    t.string   "content_english"
    t.string   "content_spanish"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "standard_id"
    t.integer  "select_id"
  end

end
