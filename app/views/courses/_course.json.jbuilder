json.extract! course, :id, :title, :description, :price, :start_date, :end_date, :level, :category, :status, :created_at, :updated_at
json.url course_url(course, format: :json)
