class Subject < ActiveRecord::Base
  belongs_to :course
  has_many :course_subjects, dependent: :destroy
  has_many :course_subjects
  has_many :lessons, dependent: :destroy
  accepts_nested_attributes_for :lessons, allow_destroy: true
end