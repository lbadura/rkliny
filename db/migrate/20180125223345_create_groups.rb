class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups, id: false do |t|
      t.string :id, null: false
      t.index :id, unique: true
      t.string :name, null: false, unique: true
      t.integer :branch_office_id
      t.string :book
      t.timestamps
    end
  end
end
