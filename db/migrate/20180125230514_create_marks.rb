class CreateMarks < ActiveRecord::Migration[5.1]
  def change
    create_table :marks, id: false do |t|
      t.string :id, null: false
      t.string :group_id, null: false
      t.string :lesson_id, null: false
      t.string :teacher_id, null: false
      t.boolean :test, default: false
      t.date :date
      t.integer :value, null: false
      t.timestamps
    end
  end
end
