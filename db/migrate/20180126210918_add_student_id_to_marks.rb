class AddStudentIdToMarks < ActiveRecord::Migration[5.1]
  def change
    add_column(:marks, :student_id, :string, null: false)
  end
end
