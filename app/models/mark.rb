class Mark < ApplicationRecord
  belongs_to :group, primary_key: "id", class_name: "Group"
end
