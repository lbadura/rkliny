class Lesson < ApplicationRecord
  self.primary_key = 'id'
  belongs_to :teacher
end
