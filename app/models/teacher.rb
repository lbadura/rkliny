class Teacher < ApplicationRecord
  self.primary_key = 'id'
  has_many :lessons
  has_many :group_teachers
  has_many :groups, through: :group_teachers
end
