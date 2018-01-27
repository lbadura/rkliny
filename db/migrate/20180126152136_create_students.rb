class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students, id: false do |t|
      t.string :id, null: false
      t.index :id, unique: true
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :office_id, null: false
      t.timestamps
    end
  end
end
