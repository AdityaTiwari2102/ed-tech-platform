class Course < ApplicationRecord
  has_many :tutors

  enum status: { live: 'live', inactive: 'inactive' }
  enum level: { beginner: 'beginner', intermediate: 'intermediate', advanced: 'advanced' }
  enum category: { web_development: 'web_development', mobile_development: 'mobile_development', data_science: 'data_science', design: 'design' }

  validates :title, presence: true, uniqueness: true
  validates :price, numericality: { greater_than_or_equal_to: 1000 }
  validates :start_date, comparison: { greater_than_or_equal_to: Date.current }
  validates :end_date, comparison: { greater_than: :start_date }
  validates :description, length: { maximum: 100 }, allow_blank: true
  validates :category, :level, :status, presence: true
end
