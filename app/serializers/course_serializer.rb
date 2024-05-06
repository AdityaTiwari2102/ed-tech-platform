class CourseSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :price, :start_date, :end_date, :level, :category, :status

  has_many :tutors, serializer: TutorsSerializer
end