class Course < ApplicationRecord
  
  has_many :student_courses
  has_many :students, through: :student_courses
  
  validates :short_name, presence: true, length: {minimum: 3, maximum: 7}
  validates :name, presence: true, length: {minimum: 5, maximum: 50}
  validates :description, presence: true, length: {minimum: 10, maximum: 200}
  
  
end
