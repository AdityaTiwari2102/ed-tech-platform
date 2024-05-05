# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_05_05_104044) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string "title", null: false, comment: "Course title"
    t.string "description", comment: "Course description"
    t.integer "price", null: false, comment: "Price of the course in INR. Must be greater than or equal to 1000."
    t.date "start_date", null: false, comment: "Course commencement date"
    t.date "end_date", null: false, comment: "Course completion date"
    t.string "level", default: "beginner", null: false, comment: "Course level: beginner, intermediate, advanced"
    t.string "category", default: "web_development", null: false, comment: "Course category: web_development, mobile_development, data_science, design"
    t.string "status", default: "live", null: false, comment: "Course status: live, inactive"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category"], name: "index_courses_on_category"
    t.index ["level"], name: "index_courses_on_level"
    t.index ["status"], name: "index_courses_on_status"
    t.index ["title"], name: "index_courses_on_title", unique: true
  end

end
