class Group < ApplicationRecord
  self.primary_key = 'id'
  has_many :marks
  has_many :students
  has_many :lessons
  has_many :group_teachers
  has_many :teachers, through: :group_teachers
end
