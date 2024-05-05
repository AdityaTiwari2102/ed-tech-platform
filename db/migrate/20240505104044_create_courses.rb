class CreateCourses < ActiveRecord::Migration[7.1]
  def change
    create_table :courses do |t|
      t.string :title, null: false, index: { unique: true }, comment: 'Course title'
      t.string :description, null: true, comment: 'Course description'
      t.integer :price, null: false, comment: 'Price of the course in INR. Must be greater than or equal to 1000.'
      t.date :start_date, null: false, comment: 'Course commencement date'
      t.date :end_date, null: false, comment: 'Course completion date'
      t.string :level, null: false, index: true, default: 'beginner',comment: 'Course level: beginner, intermediate, advanced'
      t.string :category, null: false, index: true, default: 'web_development', comment: 'Course category: web_development, mobile_development, data_science, design'
      t.string :status, null: false, index: true, default: 'live', comment: 'Course status: live, inactive'

      t.timestamps
    end
  end
end
