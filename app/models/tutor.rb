class Tutor < ApplicationRecord
  belongs_to :course

  validates :name, :course, presence: true
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  delegate :title, to: :course, prefix: true
end
