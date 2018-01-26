class Group < ApplicationRecord
  has_many :marks, primary_key: "id", foreign_key: "group_id", class_name: "Mark"
end
