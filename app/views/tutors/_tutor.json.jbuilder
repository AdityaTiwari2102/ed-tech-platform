json.extract! tutor, :id, :name, :email, :course_id, :created_at, :updated_at
json.url tutor_url(tutor, format: :json)
