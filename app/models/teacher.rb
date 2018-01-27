class Teacher < ApplicationRecord
  self.primary_key = 'id'
  has_many :lessons
end
