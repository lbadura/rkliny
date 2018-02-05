class DropGroupIdFromTeachers < ActiveRecord::Migration[5.1]
  def change
    remove_column(:teachers, :group_id)
  end
end
