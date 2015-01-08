class Course < ActiveRecord::Base
  has_many :enrollments, dependent: :destroy
  has_many :users, through: :enrollments
  has_many :course_subjects, dependent: :destroy
  has_many :subjects, through: :course_subjects
  validates :name,  presence: true, uniqueness: true, length: { maximum: 50 },
        allow_blank: true
  validates :instruction,  presence: true, uniqueness: true, length: { maximum: 500 }, 
        allow_blank: true
end