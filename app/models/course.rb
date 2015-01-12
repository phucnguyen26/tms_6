class Course < ActiveRecord::Base
  has_many :users
  has_many :course_subjects, dependent: :destroy
  has_many :subjects, through: :course_subjects
  validates :name,  presence: true, uniqueness: true, length: { maximum: 50 },
        allow_blank: true
  validates :instruction,  presence: true, uniqueness: true, length: { maximum: 500 }, 
        allow_blank: true
  has_many :subjects
end