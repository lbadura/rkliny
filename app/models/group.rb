class Group < ApplicationRecord
  self.primary_key = 'id'
  has_many :marks
  has_many :students
  has_many :lessons
end
