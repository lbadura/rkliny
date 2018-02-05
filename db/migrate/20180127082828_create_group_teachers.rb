class CreateGroupTeachers < ActiveRecord::Migration[5.1]
  def change
    create_table :group_teachers do |t|
      t.references :group, foreign_key: true, type: :string
      t.references :teacher, foreign_key: true, type: :string
      t.timestamps
    end
  end
end
