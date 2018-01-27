class Mark < ApplicationRecord
  self.primary_key = 'id'
  belongs_to :group, primary_key: "id", class_name: "Group"
end
