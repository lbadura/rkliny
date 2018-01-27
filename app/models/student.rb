class Student < ApplicationRecord
  self.primary_key = 'id'
  has_many :marks
end
