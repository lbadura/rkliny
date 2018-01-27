class CreateTeachers < ActiveRecord::Migration[5.1]
  def change
    create_table :teachers, id: false do |t|
      t.string :id, null: false
      t.index :id, unique: true
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :office_id
      t.timestamps
    end
  end
end
