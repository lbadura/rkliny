class CreateLessons < ActiveRecord::Migration[5.1]
  def change
    create_table :lessons, id: false do |t|
      t.string :id, null: false
      t.index :id, unique: true
      t.date :date, null: false
      t.string :group_id, null: false
      t.string :teacher_id, null: false
      t.boolean :test, default: false
      t.text :topic
      t.timestamps
    end
  end
end
